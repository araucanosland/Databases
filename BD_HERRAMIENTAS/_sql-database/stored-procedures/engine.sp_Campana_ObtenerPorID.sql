IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Campana_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Campana_ObtenerPorID]
GO
CREATE PROCEDURE [engine].[sp_Campana_ObtenerPorID]
(
	@CodCamp int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:31:49
-- Tabla Principal        : Campaña
-- Descripcion            : Recupera un registro la Campaña dado un CodCamp
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		CodCamp,
		IdentidadCamp,
		Activa
	FROM
		Campaña
	WHERE
		CodCamp = @CodCamp

END