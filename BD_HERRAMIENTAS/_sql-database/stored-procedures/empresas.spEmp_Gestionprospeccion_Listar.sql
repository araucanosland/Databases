IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Gestionprospeccion_Listar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Gestionprospeccion_Listar]
GO
CREATE PROCEDURE [empresas].[spEmp_Gestionprospeccion_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-04-2018 14:15:46
-- Tabla Principal        : TabEmp_GestionProspeccion
-- Descripcion            : Lista todos los registros de la tabla TabEmp_GestionProspeccion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		gstp_id,
		gstp_fecha,
		gstp_etapa,
		gstp_observaciones,
		gstp_fecha_accion,
		prospecto_id,
		ejecutivo_rut,
		oficina
	FROM
		TabEmp_GestionProspeccion
END