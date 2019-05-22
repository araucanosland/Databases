IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Rol_Listar]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Rol_Listar]
GO
CREATE PROCEDURE [security].[sp_Sca_Rol_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-09-2017 18:12:05
-- Tabla Principal        : TabSca_Rol
-- Descripcion            : Lista todos los registros de la tabla TabSca_Rol
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
END