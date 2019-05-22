IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Recurso_Listar]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Recurso_Listar]
GO
CREATE PROCEDURE [security].[sp_Sca_Recurso_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-09-2017 18:11:50
-- Tabla Principal        : TabSca_Recurso
-- Descripcion            : Lista todos los registros de la tabla TabSca_Recurso
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
END