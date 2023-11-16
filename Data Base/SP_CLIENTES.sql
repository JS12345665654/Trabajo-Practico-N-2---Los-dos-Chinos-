USE [CHINO-DB]
GO

--SP REGISTRAR CLIENTE
ALTER PROCEDURE SP_REGISTRARCLIENTE(
@Documento varchar(50),
@NombreCompleto varchar(50),
@Email varchar(50),
@Telefono varchar(50),
@Estado bit,
@Resultado int output,
@Mensaje varchar(500) output
)
AS
BEGIN
	SET @Resultado = 0
	DECLARE @IDPERSONA int
		IF NOT EXISTS(SELECT * FROM CLIENTE WHERE Documento = @Documento)
		BEGIN
			INSERT INTO CLIENTE(Documento,NombreCompleto,Email,Telefono,Estado) VALUES
			(@Documento,@NombreCompleto,@Email,@Telefono,@Estado)
				SET @Resultado = SCOPE_IDENTITY()
		END
		ELSE
			SET @Mensaje = 'El número de documento ya existe'
END
GO

-- SP MODIFICAR CLIENTE
CREATE PROCEDURE SP_MODIFICARCLIENTE(
@ClienteID INT,
@Documento varchar(50),
@NombreCompleto varchar(50),
@Email varchar(50),
@Telefono varchar(50),
@Estado bit,
@Resultado int output,
@Mensaje varchar(500) output
)
AS
BEGIN
	SET @Resultado = 1
	DECLARE @IDPERSONA INT
		IF NOT EXISTS(SELECT * FROM CLIENTE WHERE Documento = @Documento AND ClienteID != @ClienteID)
		BEGIN
			UPDATE CLIENTE SET
			Documento = @Documento,
			NombreCompleto = @NombreCompleto,
			Email = @Email,
			Telefono = @Telefono,
			Estado = @Estado
				WHERE ClienteID = @ClienteID
		END
		ELSE
		BEGIN
			SET @Resultado = 0
			SET @Mensaje = 'El numero de documento ya existe'
		END
END
-- SP ELIMINAR CLIENTE
