IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Gestionretencion_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Gestionretencion_ObtenerPorID]
GO
CREATE PROCEDURE [empresas].[spEmp_Gestionretencion_ObtenerPorID]
(
	@gstr_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 10-04-2018 17:58:32
-- Tabla Principal        : TabEmp_GestionRetencion
-- Descripcion            : Recupera un registro la TabEmp_GestionRetencion dado un gstr_id
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		gstr_id,
		gstr_fecha,
		gstr_etapa,
		gstr_observaciones,
		gstr_fecha_accion,
		retencion_id,
		ejecutivo_rut,
		oficina
	FROM
		TabEmp_GestionRetencion
	WHERE
		gstr_id = @gstr_id

END