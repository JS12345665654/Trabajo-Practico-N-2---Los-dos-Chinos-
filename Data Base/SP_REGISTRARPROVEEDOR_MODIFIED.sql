USE [CHINO-DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRARPROVEEDOR]    Script Date: 15/11/2023 10:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_REGISTRARPROVEEDOR](
@Documento varchar(50),
@RazonSocial BIGINT,
@Email varchar(50),
@Telefono varchar(50),
@NombreProveedor varchar(1000),
@Resultado int output,
@Estado bit,
@Mensaje varchar(500) output
)AS
BEGIN
	SET @Resultado = 0
	DECLARE @IDPERSONA int
	IF NOT EXISTS(SELECT * FROM PROVEEDOR WHERE Documento = @Documento)
	BEGIN
		INSERT INTO PROVEEDOR(Documento,RazonSocial,Email,Telefono, NombreProveedor,Estado) VALUES
		(@Documento,@RazonSocial,@Email,@Telefono, @NombreProveedor,@Estado);
			SET @Resultado = SCOPE_IDENTITY()
	END
	ELSE
		SET @Mensaje = 'El número de documento ya existe'
END
