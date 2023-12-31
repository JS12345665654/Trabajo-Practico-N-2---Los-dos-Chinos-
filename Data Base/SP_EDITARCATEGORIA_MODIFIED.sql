USE [CHINO-DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_EditarCategoria]    Script Date: 10/11/2023 16:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para modificar la CATEGORIA
ALTER PROCEDURE [dbo].[SP_EditarCategoria](
@IDCategoria int,
@Estado bit,
@Descripcion varchar(100),
@Resultado bit output,
@Mensaje varchar(500) output
)AS
BEGIN
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion and IDCategoria != @IDCategoria)
	UPDATE CATEGORIA SET
	Descripcion = @Descripcion
	WHERE IDCategoria = @IDCategoria
ELSE
	BEGIN 
		SET @Resultado = 0
		SET @Mensaje = 'No se puede repetir la descripcion de una categoria'
	END

END
