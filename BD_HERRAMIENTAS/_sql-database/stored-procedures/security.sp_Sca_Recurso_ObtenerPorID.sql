IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Recurso_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Recurso_ObtenerPorID]
GO
CREATE PROCEDURE [security].[sp_Sca_Recurso_ObtenerPorID]
(
	@CodRecurso int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-09-2017 18:11:45
-- Tabla Principal        : TabSca_Recurso
-- Descripcion            : Recupera un registro la TabSca_Recurso dado un CodRecurso
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		CodRecurso,
		Nombre,
		Descripcion
	FROM
		TabSca_Recurso
	WHERE
		CodRecurso = @CodRecurso

END