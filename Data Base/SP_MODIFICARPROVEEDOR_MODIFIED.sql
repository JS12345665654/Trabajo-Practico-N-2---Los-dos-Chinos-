USE [CHINO-DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICARPROVEEDOR]    Script Date: 15/11/2023 10:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SP MODIFICAR PROVEEDOR

ALTER PROCEDURE [dbo].[SP_MODIFICARPROVEEDOR](
@ProveedorID int,
@Documento varchar(50),
@RazonSocial BIGINT,
@Email varchar (50),
@Telefono varchar(50),
@Estado bit,
@NombreProveedor varchar(1000),
@Resultado int output,
@Mensaje varchar(500) output
)
AS
BEGIN
	SET @Resultado = 1
	DECLARE @IDPERSONA int
	   IF NOT EXISTS(SELECT * FROM PROVEEDOR WHERE Documento = @Documento AND ProveedorID != @ProveedorID)
	   BEGIN
		   UPDATE PROVEEDOR SET
		   Documento = @Documento,
		   RazonSocial = @RazonSocial,
		   Email = @Email,
		   Telefono = @Telefono,
		   NombreProveedor = @NombreProveedor,
		   Estado = Estado
		   WHERE ProveedorID = @ProveedorID
		END
		ELSE
			SET @Resultado = 0
			SET @Mensaje = 'El número de documento ya existe'
END
