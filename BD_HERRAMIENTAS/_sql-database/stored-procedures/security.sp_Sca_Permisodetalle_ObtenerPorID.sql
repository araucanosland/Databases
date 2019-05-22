IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Permisodetalle_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Permisodetalle_ObtenerPorID]
GO
CREATE PROCEDURE [security].[sp_Sca_Permisodetalle_ObtenerPorID]
(
	@CodPerDetalle int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-09-2017 18:10:59
-- Tabla Principal        : TabSca_PermisoDetalle
-- Descripcion            : Recupera un registro la TabSca_PermisoDetalle dado un CodPerDetalle
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
	WHERE
		CodPerDetalle = @CodPerDetalle

END