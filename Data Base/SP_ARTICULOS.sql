SELECT * FROM ARTICULOS
ORDER BY [Descripcion] ASC

--SP para agregar ARTICULOS
CREATE PROCEDURE SP_RegistrarArticulos(
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
		SET @Mensaje = 'Ya existe un articulo con la misma Presentacion'
END
GO

-- SP para editar ARTICULOS
CREATE PROCEDURE SP_ModificarArticulos(
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
		SET @Mensaje = 'Ya existe un producto con la misma descripcion'
	END
END
GO

-- SP para eliminar CATEGORIA
CREATE PROCEDURE SP_EliminarArticulos(
@ArticuloID BIGINT,
@Respuesta bit output,
@Mensaje varchar(500) output
)
AS
BEGIN
	SET @Respuesta = 0
	SET @Mensaje = ''
	DECLARE @pasoreglas BIT = 1

	IF EXISTS(SELECT * FROM DETALLE_COMPRA dc
	INNER JOIN ARTICULOS A ON A.ArticuloID = dc.ArticuloID
	WHERE A.ArticuloID = @ArticuloID
	)
	BEGIN 
		SET @pasoreglas = 0
		SET @Respuesta = 0
		SET @Mensaje = 'No se puede eliminar porque se encuentra relacionado a una COMPRA /n'
	END

		IF EXISTS(SELECT * FROM DETALLE_VENTA dv
		INNER JOIN ARTICULOS A ON A.ArticuloID = dv.ArticuloID
		WHERE A.ArticuloID = @ArticuloID
		)
		BEGIN
			SET @pasoreglas = 0
			SET @Respuesta = 0
			SET @Mensaje = 'No se puede eliminar porque se encuentra relacionado a una VENTA /n'
		END

		IF(@pasoreglas = 1)
		BEGIN
			DELETE FROM ARTICULOS WHERE ArticuloID = @ArticuloID
			SET @Respuesta = 1
		END
END