IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Obtiene_TipologiaSubGestion]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Obtiene_TipologiaSubGestion]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Obtiene_TipologiaSubGestion]
@ID_TEMA INT
AS 
BEGIN
	select IdSubTema, GlosaSubTema from [carteras].[TabCart_TipologiaSubGestion]
	where IdTema = @ID_TEMA
END