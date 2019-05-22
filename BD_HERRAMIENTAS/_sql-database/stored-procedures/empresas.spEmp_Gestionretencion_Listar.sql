IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Gestionretencion_Listar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Gestionretencion_Listar]
GO
CREATE PROCEDURE [empresas].[spEmp_Gestionretencion_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 10-04-2018 17:58:48
-- Tabla Principal        : TabEmp_GestionRetencion
-- Descripcion            : Lista todos los registros de la tabla TabEmp_GestionRetencion
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
END