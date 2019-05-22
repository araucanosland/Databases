IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[sp_MotorCartera_LitaRegion]') AND type = 'P')
DROP PROCEDURE [carteras].[sp_MotorCartera_LitaRegion]
GO

CREATE PROCEDURE [carteras].[sp_MotorCartera_LitaRegion]

AS
BEGIN
SELECT DISTINCT REGION_CODIGOSIAGF, REGION_NOMBRE FROM [BD_HERRAMIENTAS].[dbo].[TabMae_Comuna]
  
END