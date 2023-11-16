/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [IDCategoria]
      ,[Descripcion]
      ,[Estado]
      ,[FechaRegistro]
  FROM [CHINO-DB].[dbo].[CATEGORIA]
  ORDER BY [Descripcion] ASC