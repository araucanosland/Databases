IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Resultadogestion_Eliminar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Resultadogestion_Eliminar]
GO
CREATE PROCEDURE [empresas].[spEmp_Resultadogestion_Eliminar]
  @IdFidelizacion AS int 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	DELETE 
	FROM TabEmp_ResultadoGestion
	WHERE fidelizacion_id = @IdFidelizacion


END