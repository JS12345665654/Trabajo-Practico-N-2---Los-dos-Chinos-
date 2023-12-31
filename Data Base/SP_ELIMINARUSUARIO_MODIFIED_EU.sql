USE [CHINO-DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARUSUARIO]    Script Date: 8/11/2023 13:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_ELIMINARUSUARIO](
	@UsuarioID int,
	@Respuesta bit output,
	@Mensaje varchar(500) output
)
AS
BEGIN
		SET @Respuesta = 0
		SET @Mensaje =''
		DECLARE @pasoreglas bit = 1

		IF EXISTS(SELECT * FROM COMPRA C
		INNER JOIN USUARIO U ON U.UsuarioID = C.UsuarioID
		WHERE U.UsuarioID = @UsuarioID
		)
		BEGIN

		SET @pasoreglas = 0
		SET @Respuesta = 0
		SET @Mensaje ='No se puede eliminar el usuario porque esta vinculado a una COMPRA/n'
		END

		IF EXISTS(SELECT * FROM VENTA V
		INNER JOIN USUARIO U ON U.UsuarioID = V.UsuarioID
		WHERE U.UsuarioID = @UsuarioID
		)
		BEGIN

		SET @pasoreglas = 0
		SET @Respuesta = 0
		SET @Mensaje ='No se puede eliminar el usuario porque esta vinculado a una VENTA/n'
		END

		IF(@pasoreglas = 1)
		BEGIN
			DELETE FROM USUARIO WHERE UsuarioID = @UsuarioID
			SET @Respuesta = 1
		END
END
