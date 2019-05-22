IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Entidad_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Entidad_ObtenerPorID]
GO
CREATE PROCEDURE [engine].[sp_Entidad_ObtenerPorID]
(
	@RutEntidad int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:39:46
-- Tabla Principal        : Entidad
-- Descripcion            : Recupera un registro la Entidad dado un RutEntidad
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		RutEntidad,
		DvEntidad,
		NombreEntidad,
		EsPersonalidadJuridica
	FROM
		Entidad
	WHERE
		RutEntidad = @RutEntidad

END