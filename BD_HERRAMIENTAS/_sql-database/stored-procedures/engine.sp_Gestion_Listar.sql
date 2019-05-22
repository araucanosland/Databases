IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Gestion_Listar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Gestion_Listar]
GO
CREATE PROCEDURE [engine].[sp_Gestion_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:40:28
-- Tabla Principal        : Gestion
-- Descripcion            : Lista todos los registros de la tabla Gestion
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
END