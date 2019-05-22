IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Asignacion_Listar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Asignacion_Listar]
GO
CREATE PROCEDURE [engine].[sp_Asignacion_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:14:52
-- Tabla Principal        : Asignacion
-- Descripcion            : Lista todos los registros de la tabla Asignacion
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
		Activa=1
END