IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Ambitosretencion_Eliminar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Ambitosretencion_Eliminar]
GO
CREATE PROCEDURE [empresas].[spEmp_Ambitosretencion_Eliminar]
  @IdRetencion AS INT 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	DELETE 
	FROM TabEmp_AmbitosRetencion  
	WHERE retencion_id = @IdRetencion

END