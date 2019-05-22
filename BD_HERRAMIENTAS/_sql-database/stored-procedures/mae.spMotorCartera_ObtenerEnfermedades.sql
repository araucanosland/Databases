IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[spMotorCartera_ObtenerEnfermedades]') AND type = 'P')
DROP PROCEDURE [mae].[spMotorCartera_ObtenerEnfermedades]
GO
CREATE PROCEDURE [mae].[spMotorCartera_ObtenerEnfermedades]
AS
BEGIN
SELECT  [Patologia]
      ,[Categoria]
      ,[Id]
  FROM [BD_HERRAMIENTAS].[dbo].[Patologia]

END