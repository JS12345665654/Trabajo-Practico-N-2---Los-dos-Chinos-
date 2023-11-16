SET IDENTITY_INSERT ROL OFF;

INSERT INTO ROL(IdRol, Descripcion) 
VALUES(1,'ADMINISTRADOR');

INSERT INTO ROL(IdRol, Descripcion) 
VALUES(2,'EMPLEADO');


SET IDENTITY_INSERT USUARIO OFF;
INSERT INTO USUARIO(UsuarioID, NombreCompleto, Documento, Email, Clave, Celular,IdRol, Estado)
VALUES(0000, 'Soberón, Joaquin', 45254206, 'joaquinsobeperez@gmail.com', 'canela', 2954518184, 1,1);

INSERT INTO USUARIO(UsuarioID, NombreCompleto, Documento, Email, Clave, Celular,IdRol, Estado)
VALUES(0001, 'Soberón, Franco', 47235765, 'valenfranvalen@gmail.com', 'labarranca', 2954939283, 2,1);


INSERT INTO PERMISO(IdRol,NombreMenu) VALUES
(1, 'menuusuarios'),
(1, 'menuoperador'),
(1, 'menuclientes'),
(1, 'menuventas'),
(1, 'menucompras'),
(1, 'menuproveedores'),
(1, 'menureportes'),
(1, 'menucamaras')

INSERT INTO PERMISO(IdRol,NombreMenu) VALUES
(2, 'menuclientes'),
(2, 'menuventas'),
(2, 'menucompras'),
(2, 'menuproveedores'),
(2, 'menupasararticulocodigodebarras')


SELECT p.IdRol, p.NombreMenu FROM PERMISO p
INNER JOIN ROL r ON r.IdRol = p.IdRol
INNER JOIN USUARIO u ON u.IdRol = r.IdRol
WHERE u.UsuarioID = 0

SELECT p.IdRol, p.NombreMenu FROM PERMISO p
INNER JOIN ROL r ON r.IdRol = p.IdRol
INNER JOIN USUARIO u ON u.IdRol = r.IdRol
WHERE u.UsuarioID = 1