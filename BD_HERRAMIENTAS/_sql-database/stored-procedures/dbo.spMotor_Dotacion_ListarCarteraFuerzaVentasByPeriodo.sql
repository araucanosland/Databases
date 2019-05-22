IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Dotacion_ListarCarteraFuerzaVentasByPeriodo]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Dotacion_ListarCarteraFuerzaVentasByPeriodo]
GO
CREATE PROCEDURE [dbo].[spMotor_Dotacion_ListarCarteraFuerzaVentasByPeriodo]
  @periodo AS int 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'


	SELECT *
	FROM desarrollo.Carteras
	--WHERE Periodo = @periodo
	--AND Rut <> 'SISTEMA'	
	--WHERE Rut <> 'SISTEMA'	
	--AND AsignacionObs <> 'FFVV'
	WHERE tipo_cartera = 'FFVV'
	--order by Rut asc
	

	--SELECT distinct Rut,Nombre
	--FROM dbo.TabMotor_Dotacion
	----WHERE Periodo = @periodo
	----AND Rut <> 'SISTEMA'	
	----order by Cod_Sucursal, Sucursal, Cargo, Nombre
	--order by Rut asc
	
	
	

END