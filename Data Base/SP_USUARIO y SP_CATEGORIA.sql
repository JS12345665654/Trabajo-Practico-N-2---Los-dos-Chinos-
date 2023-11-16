--SP USUARIOS

CREATE PROCEDURE SP_REGISTRARUSUARIO(
	@Documento varchar(50),
	@NombreCompleto varchar(50),
	@Email varchar(50),
	@Clave varchar(100),
	@IdRol int,
	@Estado bit,
	@IdUsuarioResultado int output,
	@Mensaje varchar(500) output
)
AS
BEGIN
		SET @IdUsuarioResultado = 0
		SET @Mensaje =''

		IF NOT EXISTS(SELECT * FROM USUARIO WHERE Documento = @Documento)
		BEGIN
				INSERT INTO USUARIO(Documento, NombreCompleto, Email, Clave, IdRol, Estado) VALUES
				(@Documento, @NombreCompleto, @Email, @Clave, @IdRol, @Estado)

				SET @IdUsuarioResultado = SCOPE_IDENTITY()
		END
		ELSE 

		SET @Mensaje = 'No se puede repetir el documento para mas de un usuario'
END
GO

CREATE PROCEDURE SP_EDITARUSUARIO(
	@UsuarioID int,
	@Documento varchar(50),
	@NombreCompleto varchar(50),
	@Email varchar(50),
	@Clave varchar(100),
	@IdRol int,
	@Estado bit,
	@Respuesta bit output,
	@Mensaje varchar(500) output
)
AS
BEGIN
		SET @Respuesta = 0
		SET @Mensaje =''

		IF NOT EXISTS(SELECT * FROM USUARIO WHERE Documento = @Documento AND UsuarioID != @UsuarioID)
		BEGIN
				UPDATE USUARIO SET
				Documento = @Documento,
				NombreCompleto = @NombreCompleto, 
				Email = @Email,
				Clave = @Clave,
				IdRol = @IdRol,
				Estado = @Estado

				WHERE UsuarioID = @UsuarioID

				SET @Respuesta = 1
		END
		ELSE 

		SET @Mensaje = 'No se puede repetir el documento para mas de un usuario'
END
GO

CREATE PROCEDURE SP_ELIMINARUSUARIO(
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

		SET @pasoreglas = 1
		SET @Respuesta = 0
		SET @Mensaje ='No se puede eliminar el usuario porque esta vinculado a una VENTA/n'
		END

		IF(@pasoreglas = 0)
		BEGIN
			DELETE FROM USUARIO WHERE UsuarioID = @UsuarioID
			SET @Respuesta = 1
		END
END
GO


DECLARE @respuesta bit
DECLARE @mensaje VARCHAR(500)

EXEC SP_EDITARUSUARIO 6, '433222', 'Jose', 'jose@', '135', 2,1, @respuesta OUTPUT, @mensaje OUTPUT

SELECT @respuesta

SELECT @mensaje

SELECT * FROM USUARIO

----------- Procedimientos almacenados para CATEGORIAS ------
-- Procedimiento para guardar la categoria
CREATE PROCEDURE SP_RegistrarCategoria( 
	@Descripcion varchar(50),
	@Resultado int output,
	@Mensaje varchar(500) output
)AS
BEGIN
	SET @Resultado = 0
	IF NOT EXISTS(SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)
	BEGIN
		INSERT INTO CATEGORIA(Descripcion) values (@Descripcion)
		SET @Resultado = SCOPE_IDENTITY()
	END
	ELSE
		SET @Mensaje = 'No se puede repetir la descripcion de una categoria'
END
GO

-- Procedimiento para modificar la CATEGORIA
CREATE PROCEDURE SP_EditarCategoria(
@IDCategoria int,
@Descripcion varchar(50),
@Resultado bit output,
@Mensaje varchar(500)
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
GO

-- Procedimiento para modificar la CATEGORIA
CREATE PROCEDURE SP_EliminarCategoria(
@IdCategoria int,
@Resultado bit output,
@Mensaje varchar(500)
)AS
BEGIN
	SET @Resultado = 1
	IF NOT EXISTS(
	SELECT * FROM CATEGORIA C
	INNER JOIN ARTICULOS A ON A.IDCategoria = C.IDCategoria
	WHERE C.IDCategoria = @IdCategoria
	)
	BEGIN
		DELETE TOP (1) FROM CATEGORIA WHERE IDCategoria = @IdCategoria
	END
	BEGIN 
		SET @Resultado = 0
		SET @Mensaje = 'La categoria se encuentra relacionada a un producto'
	END

END
GO

Select * from CATEGORIA