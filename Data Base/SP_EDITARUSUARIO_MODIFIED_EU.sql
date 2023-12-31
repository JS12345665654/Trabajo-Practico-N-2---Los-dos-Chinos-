USE [CHINO-DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_EditarCategoria]    Script Date: 8/11/2023 13:43:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para modificar la CATEGORIA
ALTER PROCEDURE [dbo].[SP_EditarCategoria](
@IDCategoria int,
@Descripcion varchar(50),
@Resultado bit output,
@Mensaje varchar(500) output
)AS
BEGIN
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion and IDCategoria != @IdCategoria)
	UPDATE CATEGORIA SET
	Descripcion = @Descripcion
	WHERE IDCategoria = @IdCategoria
ELSE
	BEGIN 
		SET @Resultado = 0
		SET @Mensaje = 'No se puede repetir la descripcion de una categoria'
	END

END
