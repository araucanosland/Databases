IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Categoriacontacto_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Categoriacontacto_ObtenerPorID]
GO
CREATE PROCEDURE [engine].[sp_Categoriacontacto_ObtenerPorID]
(
	@CodCategoria int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:32:06
-- Tabla Principal        : CategoriaContacto
-- Descripcion            : Recupera un registro la CategoriaContacto dado un CodCategoria
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		CodCategoria,
		NombreCategoria
	FROM
		CategoriaContacto
	WHERE
		CodCategoria = @CodCategoria

END