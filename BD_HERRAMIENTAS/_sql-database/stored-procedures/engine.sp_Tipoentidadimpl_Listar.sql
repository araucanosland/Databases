IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Tipoentidadimpl_Listar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Tipoentidadimpl_Listar]
GO
CREATE PROCEDURE [engine].[sp_Tipoentidadimpl_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:42:31
-- Tabla Principal        : TipoEntidadImpl
-- Descripcion            : Lista todos los registros de la tabla TipoEntidadImpl
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		CodTipoEntidad,
		RutEntidad,
		RutPersonalidadJuridica
	FROM
		TipoEntidadImpl
END