SELECT* FROM PROVEEDOR
SELECT * FROM CATEGORIA
SELECT ProveedorID, Documento, RazonSocial, Email, Telefono, NombreProveedor, Estado FROM PROVEEDOR
UPDATE PROVEEDOR SET NombreProveedor = '"Limpieza extrema" HIGIENE DEL HOGAR'
WHERE ProveedorID = 10

SET IDENTITY_INSERT PROVEEDOR ON;
INSERT INTO PROVEEDOR(ProveedorID, Documento, RazonSocial, Email, Telefono,Estado,NombreProveedor) VALUES
(1, 34523345, 20345233455, 'SanJose@higienepersonal.com', 2932545950, 1, '"SAN JOSE" PRODUCTOS DE HIGIENTE PERSONAL');

INSERT INTO PROVEEDOR(ProveedorID, Documento, RazonSocial, Email, Telefono,Estado,NombreProveedor) VALUES
(2, 33566745, 20335667455, 'Rodriguez@enlatadosyconservas.com', 2954435953, 1, '"RODRIGUEZ" PRODUCTOS ENLATADOS Y CONSERVAS');

INSERT INTO PROVEEDOR(ProveedorID, Documento, RazonSocial, Email, Telefono,Estado,NombreProveedor) VALUES
(3, 53233345, 20532333455, 'italiainquestacasa@fabricadepastas.com', 2932545950, 1, '"Italia in questa casa" PASTAS');

INSERT INTO PROVEEDOR(ProveedorID, Documento, RazonSocial, Email, Telefono,Estado,NombreProveedor) VALUES
(4, 65789543, 20657895435, 'cereales@cosechacereales.com', 2954945950, 1, '"Arooz" CEREALES');

INSERT INTO PROVEEDOR(ProveedorID, Documento, RazonSocial, Email, Telefono,Estado,NombreProveedor) VALUES
(5, 65741543, 20657415435, 'galletitas@distribuidora.com', 2954848382, 1, '"Distribuidora" GALLETITAS DULCES');

INSERT INTO PROVEEDOR(ProveedorID, Documento, RazonSocial, Email, Telefono,Estado,NombreProveedor) VALUES
(6, 65781733, 20657817335, 'harinas@molinillo.com', 2954939294, 1, '"Molinillo" HARINAS');

INSERT INTO PROVEEDOR(ProveedorID, Documento, RazonSocial, Email, Telefono,Estado,NombreProveedor) VALUES
(7, 65789432, 206577894325, 'legumbres@elbuenpasar.com', 2954939291, 1, '"El buen pasar" LEGUMBRES');

INSERT INTO PROVEEDOR(ProveedorID, Documento, RazonSocial, Email, Telefono,Estado,NombreProveedor) VALUES
(8, 65999333, 20659993335, 'todoparatucocina@distribuidoradealimentos.com', 2954949392, 1, '"Distribuidora de alimentos" PRODUCTOS VARIOS DE COCINA');

INSERT INTO PROVEEDOR(ProveedorID, Documento, RazonSocial, Email, Telefono,Estado,NombreProveedor) VALUES
(9, 65222999, 20652229995, 'mermeladasydulces@tumejormerienda.com', 2954828483, 1, '"Tu mejor merienda" DULCES UNTABLES');

INSERT INTO PROVEEDOR(ProveedorID, Documento, RazonSocial, Email, Telefono,Estado,NombreProveedor) VALUES
(10, 55384703, 20553847035, 'lomejorparacasa@limpiezaextrema.com', 2954020343, 1, '"Limoieza extrema" HIGIENE DEL HOGAR');