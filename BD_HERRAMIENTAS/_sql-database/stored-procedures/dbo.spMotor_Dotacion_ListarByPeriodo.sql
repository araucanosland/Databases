IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Dotacion_ListarByPeriodo]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Dotacion_ListarByPeriodo]
GO
CREATE PROCEDURE [dbo].[spMotor_Dotacion_ListarByPeriodo]
  @periodo AS int 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'


	SELECT *
	FROM dbo.TabMotor_Dotacion with(index(idx_periodo_rut))
	WHERE Periodo = @periodo
	AND Rut <> 'SISTEMA'
	order by Cod_Sucursal, Sucursal, Cargo, Nombre

END