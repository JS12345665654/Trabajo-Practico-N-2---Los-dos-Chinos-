USE [CHINO-DB]
GO

SELECT Codigo FROM ARTICULOS
SELECT * FROM CATEGORIA

--UPDATE PREVIO A ELIMINAR LA CATEGORIA 'YERBA MATE'
UPDATE ARTICULOS SET IDCategoria = 8
WHERE Descripcion  = 'YERBA MATE EN SAQUITOS "AMANDA" X800G'

--DELETE DE LA CATEGORIA
DELETE FROM CATEGORIA
WHERE Descripcion = 'Yerba mate'