USE [CHINO-DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_RegistrarArticulos]    Script Date: 8/11/2023 13:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_RegistrarArticulos](
@Codigo varchar(50),
@Nombre varchar(100),
@Descripcion varchar(100),
@IDCategoria int,
@Estado bit,
@Resultado int output,
@Mensaje varchar(500) output
)as
BEGIN
	SET @Resultado = 0
	IF NOT EXISTS(SELECT * FROM ARTICULOS WHERE Codigo = @Codigo)
	BEGIN
		INSERT INTO ARTICULOS(Codigo,Nombre,Descripcion,IDCategoria,Estado) VALUES (@Codigo,@Nombre,@Descripcion,@IDCategoria,@Estado)
		SET @Resultado = SCOPE_IDENTITY()
	END
	ELSE
		SET @Mensaje = 'Ya existe un articulo con el mismo codigo'
END
