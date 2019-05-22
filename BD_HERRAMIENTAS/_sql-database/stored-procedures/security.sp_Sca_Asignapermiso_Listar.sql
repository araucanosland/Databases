IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Asignapermiso_Listar]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Asignapermiso_Listar]
GO
CREATE PROCEDURE [security].[sp_Sca_Asignapermiso_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 14-09-2017 11:19:12
-- Tabla Principal        : TabSca_AsignaPermiso
-- Descripcion            : Lista todos los registros de la tabla TabSca_AsignaPermiso
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		CodPermiso,
		Grupo
	FROM
		TabSca_AsignaPermiso
END