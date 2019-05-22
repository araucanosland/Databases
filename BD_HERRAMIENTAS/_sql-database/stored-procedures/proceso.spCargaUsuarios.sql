IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[proceso].[spCargaUsuarios]') AND type = 'P')
DROP PROCEDURE [proceso].[spCargaUsuarios]
GO
CREATE PROCEDURE [proceso].[spCargaUsuarios]
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

insert into security.TabSca_Usuario(usr_nombre, usr_clave, usr_rut)
select Nombre,Rut, Rut
from dbo.TabMotor_Dotacion
where Rut not in (select usr_rut from security.TabSca_Usuario)
and Periodo = (select max(Periodo) from dbo.TabMotor_Dotacion)



END