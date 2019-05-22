IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Entidad_Listar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Entidad_Listar]
GO
CREATE PROCEDURE [engine].[sp_Entidad_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:39:50
-- Tabla Principal        : Entidad
-- Descripcion            : Lista todos los registros de la tabla Entidad
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
END