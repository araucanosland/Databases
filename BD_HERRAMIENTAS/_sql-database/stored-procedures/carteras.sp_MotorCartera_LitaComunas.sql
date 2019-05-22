IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[sp_MotorCartera_LitaComunas]') AND type = 'P')
DROP PROCEDURE [carteras].[sp_MotorCartera_LitaComunas]
GO
CREATE PROCEDURE [carteras].[sp_MotorCartera_LitaComunas]
@ID_REGION INT
AS
BEGIN
SELECT COMUNA_CODIGO, COMUNA_NOMBRESIAGF FROM [BD_HERRAMIENTAS].[dbo].[TabMae_Comuna]
WHERE REGION_CODIGOSIAGF = @ID_REGION
  
END