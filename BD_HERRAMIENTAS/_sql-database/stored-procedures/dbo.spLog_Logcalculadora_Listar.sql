IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spLog_Logcalculadora_Listar]') AND type = 'P')
DROP PROCEDURE [dbo].[spLog_Logcalculadora_Listar]
GO
CREATE PROCEDURE [dbo].[spLog_Logcalculadora_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 19-04-2018 12:51:46
-- Tabla Principal        : TabMotor_LogCalculadora
-- Descripcion            : Lista todos los registros de la tabla TabMotor_LogCalculadora
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		lgc_id,
		fecha_accion,
		ejecutivo,
		oficina,
		rut_afiliado,
		renta_depurada_crm,
		descuento_legal,
		procentaje_descuento,
		total_descuentos_liquidacion,
		descuentos_legales_primer_mes,
		descuentos_legales_segundo_mes,
		descuentos_legales_tercer_mes,
		descuentos_legales_promedio,
		tiene_descuentos_planilla,
		descuentos_creditos_planilla,
		cuota_maxima_descontar_caja,
		rut_empresa
	FROM
		TabMotor_LogCalculadora
END