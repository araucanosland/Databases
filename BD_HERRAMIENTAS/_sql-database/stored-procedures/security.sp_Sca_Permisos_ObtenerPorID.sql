IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Permisos_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Permisos_ObtenerPorID]
GO
CREATE PROCEDURE [security].[sp_Sca_Permisos_ObtenerPorID]
(
	@CodPermiso int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-09-2017 18:11:28
-- Tabla Principal        : TabSca_Permisos
-- Descripcion            : Recupera un registro la TabSca_Permisos dado un CodPermiso
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
	WHERE
		CodPermiso = @CodPermiso

END