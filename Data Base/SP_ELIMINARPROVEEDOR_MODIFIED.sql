USE [CHINO-DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARPROVEEDOR]    Script Date: 16/11/2023 15:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_ELIMINARPROVEEDOR](
@ProveedorID int,
@Resultado int output,
@Mensaje varchar(500) output
)
AS
BEGIN
	SET @Resultado = 0
		IF NOT EXISTS(	
		SELECT * FROM PROVEEDOR P
		INNER JOIN COMPRA C ON P.ProveedorID = C.ProveedorID
		WHERE P.ProveedorID = @ProveedorID
		)
		BEGIN
			DELETE TOP(1) FROM PROVEEDOR WHERE ProveedorID = @ProveedorID
		END
		BEGIN
			SET @Resultado = 1
			SET @Mensaje = 'El proveedor se encuentra relacionado a una compra'
		END
END