IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Campana_Listar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Campana_Listar]
GO
CREATE PROCEDURE [engine].[sp_Campana_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:31:54
-- Tabla Principal        : Campaña
-- Descripcion            : Lista todos los registros de la tabla Campaña
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
END