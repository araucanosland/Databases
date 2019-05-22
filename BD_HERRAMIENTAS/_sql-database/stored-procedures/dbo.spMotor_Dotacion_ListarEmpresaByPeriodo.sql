IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Dotacion_ListarEmpresaByPeriodo]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Dotacion_ListarEmpresaByPeriodo]
GO
CREATE PROCEDURE [dbo].[spMotor_Dotacion_ListarEmpresaByPeriodo]
  @periodo AS int 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'


	SELECT *
	FROM TabMotor_Empresa
	--WHERE Periodo = @periodo
	--AND Rut <> 'SISTEMA'
	--order by rut_ejecutivo,rut_empresa

END