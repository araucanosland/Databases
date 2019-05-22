IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_ContactoPensionados]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_ContactoPensionados]
(
    [con_contacto_uid] int NOT NULL,
    [con_contacto] varchar(5) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [con_forma_contacto] int NULL,
    [con_no_contacto_fono] int NULL,
    [con_no_contacto_domicilo] int NULL,
    [con_no_observacion_contacto] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [con_fecha_accion_contacto] datetime NOT NULL,
    [con_ejecutivo_rut] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [con_oficina] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
)