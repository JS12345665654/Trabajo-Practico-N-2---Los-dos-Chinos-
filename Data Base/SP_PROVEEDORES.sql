SELECT * FROM PROVEEDOR

USE [CHINO-DB]
GO
--SP REGISTRAR PROVEEDOR

CREATE PROCEDURE SP_REGISTRARPROVEEDOR(
@Documento varchar(50),
@RazonSocial varchar(50),
@Email varchar(50),
@Telefono varchar(50),
@Direccion varchar(50),
@Rubro varchar(50),
@Resultado int output,
@Estado bit,
@Mensaje varchar(500) output
)AS
BEGIN
	SET @Resultado = 0
	DECLARE @IDPERSONA int
	IF NOT EXISTS(SELECT * FROM PROVEEDOR WHERE Documento = @Documento)
	BEGIN
		INSERT INTO PROVEEDOR(Documento,RazonSocial,Email,Telefono,Dirección,Rubro,Estado) VALUES
		(@Documento,@RazonSocial,@Email,@Telefono,@Direccion,@Rubro,@Estado);
			SET @Resultado = SCOPE_IDENTITY()
	END
	ELSE
		SET @Mensaje = 'El número de documento ya existe'
END
GO
--SP MODIFICAR PROVEEDOR

CREATE PROCEDURE SP_MODIFICARPROVEEDOR(
@ProveedorID int,
@Documento varchar(50),
@RazonSocial varchar(50),
@Email varchar (50),
@Telefono varchar(50),
@Dirección varchar(50),
@Rubro varchar(50),
@Estado bit,
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
		   Dirección = @Dirección,
		   Rubro = @Rubro,
		   Estado = Estado
		   WHERE ProveedorID = @ProveedorID
		END
		ELSE
			SET @Resultado = 0
			SET @Mensaje = 'El número de documento ya existe'
END
GO
--SP ELIMINAR PROVEEDOR

CREATE PROCEDURE SP_ELIMINARPROVEEDOR(
@ProveedorID int,
@Resultado int output,
@Mensaje varchar(500) output
)
AS
BEGIN
	SET @Resultado = 1
		IF NOT EXISTS(
		SELECT * FROM PROVEEDOR P
		INNER JOIN COMPRA C ON P.ProveedorID = C.ProveedorID
		WHERE P.ProveedorID = @ProveedorID
		)
		BEGIN
			DELETE TOP(1) FROM PROVEEDOR WHERE ProveedorID = @ProveedorID
		END
		BEGIN
			SET @Resultado = 0
			SET @Mensaje = 'El proveedor se encuentra relacionado a una compra'
		END
END