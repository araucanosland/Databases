IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Rol_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Rol_ObtenerPorID]
GO
CREATE PROCEDURE [security].[sp_Sca_Rol_ObtenerPorID]
(
	@CodRol int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-09-2017 18:12:01
-- Tabla Principal        : TabSca_Rol
-- Descripcion            : Recupera un registro la TabSca_Rol dado un CodRol
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		CodRol,
		Nombre
	FROM
		TabSca_Rol
	WHERE
		CodRol = @CodRol

END