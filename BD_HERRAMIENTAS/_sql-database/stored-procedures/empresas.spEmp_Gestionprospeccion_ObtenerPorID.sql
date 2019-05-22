IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Gestionprospeccion_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Gestionprospeccion_ObtenerPorID]
GO
CREATE PROCEDURE [empresas].[spEmp_Gestionprospeccion_ObtenerPorID]
(
	@gstp_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-04-2018 14:15:38
-- Tabla Principal        : TabEmp_GestionProspeccion
-- Descripcion            : Recupera un registro la TabEmp_GestionProspeccion dado un gstp_id
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
	WHERE
		gstp_id = @gstp_id

END