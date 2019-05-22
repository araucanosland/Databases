IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Estadolicencia_Listar]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Estadolicencia_Listar]
GO
CREATE PROCEDURE [licencias].[sp_Lic_Estadolicencia_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 28-09-2017 16:37:02
-- Tabla Principal        : TabLic_EstadoLicencia
-- Descripcion            : Lista todos los registros de la tabla TabLic_EstadoLicencia
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		CodEstado,
		Nombre
	FROM
		TabLic_EstadoLicencia
END