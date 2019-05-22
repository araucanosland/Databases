IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Obtiene_TipologiaGestion]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Obtiene_TipologiaGestion]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Obtiene_TipologiaGestion] 
AS 
BEGIN
	select IdTema, GlosaGestion from [carteras].[TabCart_TipologiaGestion]
END