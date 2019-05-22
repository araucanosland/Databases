IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_VerificarPermiso]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_VerificarPermiso]
GO
CREATE PROCEDURE [security].[sp_Sca_VerificarPermiso]
(
	@Token VARCHAR(50),
	@Controlador VARCHAR(50),
	@Accion VARCHAR(50)
)
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	SELECT d.*
	FROM dbo.TabMotor_Dotacion a
	INNER JOIN security.TabSca_AsignaPermiso b on ((a.Rut = b.Grupo) OR (a.Cargo = b.Grupo) OR (b.Grupo = '*') )
	INNER JOIN security.TabSca_Permisos c on b.CodPermiso = c.CodPermiso
	INNER JOIN security.TabSca_PermisoDetalle d on c.CodPermiso = d.CodPermiso
	WHERE a.Periodo = (select max(Periodo) from dbo.TabMotor_Dotacion) 
	AND a.Rut = security.fnSca_ObtenerRutByToken(@Token)
	AND d.Controlador = @Controlador
	AND d.Accion = @Accion

END