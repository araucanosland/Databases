IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_ListaComunas]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_ListaComunas]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_ListaComunas]
AS
BEGIN
	SELECT COMUNA_CODIGO, COMUNA_NOMBRESIAGF FROM [SERV-55].[BD_ODS].[dbo].[TabMae_Comuna]
END