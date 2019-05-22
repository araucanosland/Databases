IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Menu_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Menu_ObtenerPorID]
GO
CREATE PROCEDURE [security].[sp_Sca_Menu_ObtenerPorID]
(
	@CodMenu int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 21-09-2017 10:32:41
-- Tabla Principal        : TabSca_Menu
-- Descripcion            : Recupera un registro la TabSca_Menu dado un CodMenu
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		CodMenu,
		CodRecurso,
		CodMenuPadre,
		Enlace,
		Icono,
		Orden,
		CodCategoria
	FROM
		TabSca_Menu
	WHERE
		CodMenu = @CodMenu

END