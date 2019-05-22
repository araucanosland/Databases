IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Asignacion_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Asignacion_ObtenerPorID]
GO
CREATE PROCEDURE [engine].[sp_Asignacion_ObtenerPorID]
(
	@CodAsignacion bigint
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 14:35:19
-- Tabla Principal        : Asignacion
-- Descripcion            : Recupera un registro la Asignacion dado un CodAsignacion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		CodAsignacion,
		CodCamp,
		RutEntidad,
		RutEjecutivo
	FROM
		Asignacion
	WHERE
		CodAsignacion = @CodAsignacion

END