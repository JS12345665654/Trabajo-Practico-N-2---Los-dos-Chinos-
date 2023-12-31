USE [CHINO-DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarCategoria]    Script Date: 10/11/2023 18:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_EliminarCategoria](
@IDCategoria int,
@Resultado bit output,
@Mensaje varchar(500) output
)AS
BEGIN
	SET @Resultado = 1
	IF NOT EXISTS(
	SELECT * FROM CATEGORIA C
	INNER JOIN ARTICULOS A ON A.IDCategoria = C.IDCategoria
	WHERE C.IDCategoria = @IDCategoria
	)
	BEGIN
		DELETE TOP (1) FROM CATEGORIA WHERE IDCategoria = @IDCategoria
	END
	BEGIN 
		SET @Resultado = 0
		SET @Mensaje = 'La categoria se encuentra relacionada a un producto'
	END
END
