IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_LogCalculadora]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_LogCalculadora]
(
    [lgc_id] int NOT NULL IDENTITY(1, 1),
    [fecha_accion] datetime NOT NULL,
    [ejecutivo] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [oficina] int NOT NULL,
    [rut_afiliado] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [renta_depurada_crm] bigint NULL,
    [descuento_legal] bigint NULL,
    [procentaje_descuento] bigint NULL,
    [total_descuentos_liquidacion] bigint NULL,
    [descuentos_legales_primer_mes] bigint NULL,
    [descuentos_legales_segundo_mes] bigint NULL,
    [descuentos_legales_tercer_mes] bigint NULL,
    [descuentos_legales_promedio] bigint NULL,
    [tiene_descuentos_planilla] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [descuentos_creditos_planilla] bigint NULL,
    [cuota_maxima_descontar_caja] bigint NULL,
    [rut_empresa] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabMotor__C0CA48D2731B1205] PRIMARY KEY CLUSTERED ([lgc_id] ASC)
)