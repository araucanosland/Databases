IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Categoriacontacto_Listar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Categoriacontacto_Listar]
GO
CREATE PROCEDURE [engine].[sp_Categoriacontacto_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:32:17
-- Tabla Principal        : CategoriaContacto
-- Descripcion            : Lista todos los registros de la tabla CategoriaContacto
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
END