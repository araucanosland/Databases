IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Permisodetalle_Listar]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Permisodetalle_Listar]
GO
CREATE PROCEDURE [security].[sp_Sca_Permisodetalle_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-09-2017 18:11:07
-- Tabla Principal        : TabSca_PermisoDetalle
-- Descripcion            : Lista todos los registros de la tabla TabSca_PermisoDetalle
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		CodPerDetalle,
		CodPermiso,
		Controlador,
		Accion
	FROM
		TabSca_PermisoDetalle
END