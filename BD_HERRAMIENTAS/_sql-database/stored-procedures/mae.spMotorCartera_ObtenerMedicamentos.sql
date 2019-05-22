IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[spMotorCartera_ObtenerMedicamentos]') AND type = 'P')
DROP PROCEDURE [mae].[spMotorCartera_ObtenerMedicamentos]
GO
CREATE PROCEDURE [mae].[spMotorCartera_ObtenerMedicamentos]
AS
BEGIN
SELECT  [Medicamento]
      ,[Categoria]
      ,[Id]
  FROM [BD_HERRAMIENTAS].[dbo].[Medicamento]

END