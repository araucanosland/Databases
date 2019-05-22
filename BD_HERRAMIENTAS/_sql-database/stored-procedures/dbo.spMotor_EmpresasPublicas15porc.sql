IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_EmpresasPublicas15porc]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_EmpresasPublicas15porc]
GO
CREATE PROCEDURE [dbo].[spMotor_EmpresasPublicas15porc]
  @emp_rut AS varchar(50) 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	SELECT COUNT(*) Existe
	FROM [serv-55].BD_ODS.dbo.TabMae_EmprePublicas15porc
	WHERE EMPRESA_RUT = @emp_rut
	

END