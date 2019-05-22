IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Permisos_Listar]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Permisos_Listar]
GO
CREATE PROCEDURE [security].[sp_Sca_Permisos_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-09-2017 18:11:33
-- Tabla Principal        : TabSca_Permisos
-- Descripcion            : Lista todos los registros de la tabla TabSca_Permisos
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		CodPermiso,
		CodRecurso,		
		CodRol
	FROM
		TabSca_Permisos
END