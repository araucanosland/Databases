IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Tipoendidad_Listar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Tipoendidad_Listar]
GO
CREATE PROCEDURE [engine].[sp_Tipoendidad_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:42:08
-- Tabla Principal        : TipoEndidad
-- Descripcion            : Lista todos los registros de la tabla TipoEndidad
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		CodTipoEntidad,
		NombreTipoEntidad
	FROM
		TipoEndidad
END