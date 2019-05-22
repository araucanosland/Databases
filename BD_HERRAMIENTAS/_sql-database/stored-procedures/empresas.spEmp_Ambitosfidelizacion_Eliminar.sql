IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Ambitosfidelizacion_Eliminar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Ambitosfidelizacion_Eliminar]
GO
CREATE PROCEDURE [empresas].[spEmp_Ambitosfidelizacion_Eliminar]
  @IdFidelizacion AS INT 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	DELETE 
	FROM TabEmp_AmbitosFidelizacion  
	WHERE fidelizacion_id = @IdFidelizacion

END