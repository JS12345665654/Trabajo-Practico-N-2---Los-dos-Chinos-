USE [CHINO-DB]

GO

--Esta tabla queda sin relación pero la uso para la consulta de CONFIGURACION
CREATE table NEGOCIO(
NegocioID INT PRIMARY KEY IDENTITY,
CUIT int,
RazonSocial varchar(100),
Dirección varchar(50),
Logo varbinary(MAX) NULL
)
GO

CREATE table ROL(
IdRol int primary key identity,
Descripcion varchar(50),
FechaRegistro datetime default getdate()
)
GO

CREATE table PERMISO(
IdPermiso int primary key identity,
IdRol int references ROL(IdRol),
NombreMenu varchar(50),
FechaRegistro datetime default getdate()
)
GO

CREATE table PROVEEDOR(
ProveedorID int primary key identity,
Documento varchar(50),
RazonSocial varchar(50),
Email varchar(50),
Telefono varchar(50),
Dirección varchar(50),
Rubro varchar(50),
Estado bit,
FechaRegistro datetime default getdate()
)
GO


CREATE table USUARIO(
UsuarioID int primary key identity,
NombreCompleto varchar(50),
Documento varchar(50),
Email varchar(50),
Clave varchar(100),
Celular varchar(50),
IdRol int references ROL(IdRol),
Estado bit,
FechaRegistro datetime default getdate()
)
GO

CREATE table CLIENTE(
ClienteID int primary key identity,
Documento varchar(50),
NombreCompleto varchar(50),
Email varchar(50),
Telefono varchar(50),
Estado bit,
FechaRegistro datetime default getdate()
)
GO


CREATE table SESION(
SesionID int primary key identity,
UsuarioID int references USUARIO(UsuarioID),
Fecha datetime default getdate(),
Horainicio datetime default getdate(),
Horafin datetime default getdate(),
IdRol int references ROL(IdRol)
)
GO

CREATE table COMPRA(
IDCompra int primary key identity,
UsuarioID int references USUARIO(UsuarioID),
ProveedorID int references PROVEEDOR(ProveedorID),
TipoDocumento varchar(50),
NumeroDocumento varchar(50),
MontoTotal decimal(10, 2),
FechaRegistro datetime default getdate()
)
GO

CREATE table CATEGORIA(
IDCategoria int primary key identity,
Descripcion varchar(100),
Estado bit,
FechaRegistro datetime default getdate()
)
GO


CREATE table ARTICULOS(
ArticuloID BIGINT primary key identity,
Descripcion varchar(100),
Presentacion varchar(500),
Codigo varchar(50),
Nombre varchar(100), 
IDCategoria int references CATEGORIA(IDCategoria),
Stock int not null default 0,
PrecioVenta decimal(10,2) default 0,
PrecioCompra decimal(10,2) default 0,
Estado bit,
FechaRegistro datetime default getdate()
)
GO

CREATE table DETALLE_COMPRA(
IDDetalleCompra int primary key identity,
IDCompra int references COMPRA(IDCompra),
ArticuloID BIGINT references ARTICULOS(ArticuloID),
PrecioVenta decimal(10,2) default 0,
PrecioCompra decimal(10,2) default 0,
Cantidad int,
MontoTotal decimal(10, 2),
FechaRegistro datetime default getdate()
)
GO

CREATE table VENTA(
IDVenta int primary key identity,
UsuarioID int references USUARIO(UsuarioID),
TipoDocumento varchar(50),
NumeroDocumento varchar(50),
DocumentoCliente varchar(50),
NombreCliente varchar(100),
MontoPago decimal(10,2),
MontoCambio decimal(10,2),
MontoTotal decimal(10,2),
FechaRegistro datetime default getdate()
)
GO

CREATE table DETALLE_VENTA(
IDDetalleVenta int primary key identity,
IDVenta int references VENTA(IDVenta),
ArticuloID BIGINT references ARTICULOS(ArticuloID),
PrecioVenta decimal(10,2) default 0,
Cantidad int,
SubTotal decimal(10, 2),
FechaRegistro datetime default getdate()
)
GO
