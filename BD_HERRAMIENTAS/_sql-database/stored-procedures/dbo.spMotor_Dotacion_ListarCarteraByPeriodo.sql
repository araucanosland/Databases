IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Dotacion_ListarCarteraByPeriodo]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Dotacion_ListarCarteraByPeriodo]
GO
CREATE PROCEDURE [dbo].[spMotor_Dotacion_ListarCarteraByPeriodo]
  @periodo AS int 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'


	SELECT cod_oficina,tipo_cartera,rut_ejecutivo,rut_empresa,fecha_actualizacion
	FROM desarrollo.Carteras
	--WHERE Periodo = @periodo
	--AND Rut <> 'SISTEMA'
	order by rut_ejecutivo,rut_empresa

END