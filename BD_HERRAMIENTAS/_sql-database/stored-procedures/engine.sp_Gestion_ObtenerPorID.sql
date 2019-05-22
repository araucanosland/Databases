IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Gestion_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Gestion_ObtenerPorID]
GO
CREATE PROCEDURE [engine].[sp_Gestion_ObtenerPorID]
(
	@CodGestion bigint
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:40:23
-- Tabla Principal        : Gestion
-- Descripcion            : Recupera un registro la Gestion dado un CodGestion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		CodGestion,
		CodAsignacion,
		FechaAccion,
		FechaCompromiso,
		CodEstadoGestion,
		NotaGestion,
		RutEjecutivo,
		CodOficina
	FROM
		Gestion
	WHERE
		CodGestion = @CodGestion

END