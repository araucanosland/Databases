IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Tipoentidadimpl_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Tipoentidadimpl_ObtenerPorID]
GO
CREATE PROCEDURE [engine].[sp_Tipoentidadimpl_ObtenerPorID]
(
	@CodTipoEntidad int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:42:26
-- Tabla Principal        : TipoEntidadImpl
-- Descripcion            : Recupera un registro la TipoEntidadImpl dado un CodTipoEntidad
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		CodTipoEntidad,
		RutEntidad,
		RutPersonalidadJuridica
	FROM
		TipoEntidadImpl
	WHERE
		CodTipoEntidad = @CodTipoEntidad

END