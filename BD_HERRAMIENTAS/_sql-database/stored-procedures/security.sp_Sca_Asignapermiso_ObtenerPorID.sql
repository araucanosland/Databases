IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Asignapermiso_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Asignapermiso_ObtenerPorID]
GO
CREATE PROCEDURE [security].[sp_Sca_Asignapermiso_ObtenerPorID]
(
	@CodPermiso int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 14-09-2017 11:19:06
-- Tabla Principal        : TabSca_AsignaPermiso
-- Descripcion            : Recupera un registro la TabSca_AsignaPermiso dado un CodPermiso
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
	WHERE
		CodPermiso = @CodPermiso

END