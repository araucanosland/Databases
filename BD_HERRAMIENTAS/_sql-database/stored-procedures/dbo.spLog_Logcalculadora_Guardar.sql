IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spLog_Logcalculadora_Guardar]') AND type = 'P')
DROP PROCEDURE [dbo].[spLog_Logcalculadora_Guardar]
GO
CREATE PROCEDURE [dbo].[spLog_Logcalculadora_Guardar]
(
	@lgc_id int,
	@fecha_accion datetime,
	@ejecutivo varchar(50),
	@oficina int,
	@rut_afiliado varchar(50),
	@renta_depurada_crm bigint,
	@descuento_legal bigint,
	@procentaje_descuento bigint,
	@total_descuentos_liquidacion bigint,
	@descuentos_legales_primer_mes bigint,
	@descuentos_legales_segundo_mes bigint,
	@descuentos_legales_tercer_mes bigint,
	@descuentos_legales_promedio bigint,
	@tiene_descuentos_planilla varchar(20),
	@descuentos_creditos_planilla bigint,
	@cuota_maxima_descontar_caja bigint,
	@rut_empresa varchar(50)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 19-04-2018 12:50:32
-- Tabla Principal        : TabMotor_LogCalculadora
-- Descripcion            : Guarda un registro en la tabla TabMotor_LogCalculadora
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @lgc_id

	IF @identity > 0
	BEGIN
		UPDATE TabMotor_LogCalculadora SET 
			fecha_accion = @fecha_accion,
			ejecutivo = @ejecutivo,
			oficina = @oficina,
			rut_afiliado = @rut_afiliado,
			renta_depurada_crm = @renta_depurada_crm,
			descuento_legal = @descuento_legal,
			procentaje_descuento = @procentaje_descuento,
			total_descuentos_liquidacion = @total_descuentos_liquidacion,
			descuentos_legales_primer_mes = @descuentos_legales_primer_mes,
			descuentos_legales_segundo_mes = @descuentos_legales_segundo_mes,
			descuentos_legales_tercer_mes = @descuentos_legales_tercer_mes,
			descuentos_legales_promedio = @descuentos_legales_promedio,
			tiene_descuentos_planilla = @tiene_descuentos_planilla,
			descuentos_creditos_planilla = @descuentos_creditos_planilla,
			cuota_maxima_descontar_caja = @cuota_maxima_descontar_caja,
			rut_empresa = @rut_empresa
		WHERE lgc_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabMotor_LogCalculadora
		(
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
		)
		VALUES
		(
			@fecha_accion,
			@ejecutivo,
			@oficina,
			@rut_afiliado,
			@renta_depurada_crm,
			@descuento_legal,
			@procentaje_descuento,
			@total_descuentos_liquidacion,
			@descuentos_legales_primer_mes,
			@descuentos_legales_segundo_mes,
			@descuentos_legales_tercer_mes,
			@descuentos_legales_promedio,
			@tiene_descuentos_planilla,
			@descuentos_creditos_planilla,
			@cuota_maxima_descontar_caja,
			@rut_empresa
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END