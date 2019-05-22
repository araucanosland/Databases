IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Tipocontacto_Listar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Tipocontacto_Listar]
GO
CREATE PROCEDURE [engine].[sp_Tipocontacto_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:41:12
-- Tabla Principal        : TipoContacto
-- Descripcion            : Lista todos los registros de la tabla TipoContacto
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		CodTipo,
		NombreTipo
	FROM
		TipoContacto
END