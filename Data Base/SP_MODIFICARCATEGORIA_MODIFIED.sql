USE [CHINO-DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_ModificarArticulos]    Script Date: 10/11/2023 19:37:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_ModificarArticulos](
@ArticuloID BIGINT,
@Codigo varchar(50),
@Nombre varchar(100),
@Descripcion varchar(100),
@IDCategoria int,
@Estado bit,
@Resultado bit output,
@Mensaje varchar(500) output
)AS
BEGIN
	SET @Resultado = 1
	IF NOT EXISTS(SELECT * FROM ARTICULOS WHERE Codigo = @Codigo AND ArticuloID != @ArticuloID)

		UPDATE ARTICULOS SET
		Codigo = @Codigo,
		Nombre = @Nombre,
		Estado = @Estado,
		Descripcion = @Descripcion,
		IDCategoria = @IDCategoria
		WHERE ArticuloID = @ArticuloID
	ELSE 
	BEGIN
		SET @Resultado = 0
		SET @Mensaje = 'Ya existe un producto con el mismo codigo'
	END
END
