IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Dotacion_ListarFuerzaVentasByPeriodo]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Dotacion_ListarFuerzaVentasByPeriodo]
GO
CREATE PROCEDURE [dbo].[spMotor_Dotacion_ListarFuerzaVentasByPeriodo]
  @periodo AS int 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'


	SELECT *
	FROM dbo.TabMotor_Dotacion
	--WHERE Periodo = @periodo
	WHERE Rut <> 'SISTEMA'
	AND AsignacionObs = 'FFVV'
	order by Cod_Sucursal, Sucursal, Cargo, Nombre

END