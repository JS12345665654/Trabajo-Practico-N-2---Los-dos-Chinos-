USE [CHINO-DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_RegistrarCategoria]    Script Date: 10/11/2023 15:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_RegistrarCategoria]( 
	@Descripcion varchar(100),
	@Estado bit,
	@Resultado int output,
	@Mensaje varchar(500) output
)AS
BEGIN
	SET @Resultado = 0
	IF NOT EXISTS(SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)
	BEGIN
		INSERT INTO CATEGORIA(Descripcion, Estado) values (@Descripcion, @Estado)
		SET @Resultado = SCOPE_IDENTITY()
	END
	ELSE
		SET @Mensaje = 'No se puede repetir la descripcion de una categoria'
END

