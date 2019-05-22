IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Tipoendidad_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Tipoendidad_ObtenerPorID]
GO
CREATE PROCEDURE [engine].[sp_Tipoendidad_ObtenerPorID]
(
	@CodTipoEntidad int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:41:26
-- Tabla Principal        : TipoEndidad
-- Descripcion            : Recupera un registro la TipoEndidad dado un CodTipoEntidad
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		CodTipoEntidad,
		NombreTipoEntidad
	FROM
		TipoEndidad
	WHERE
		CodTipoEntidad = @CodTipoEntidad

END