IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_GestionPensionados]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_GestionPensionados]
(
    [ges_bcam_uid] int NOT NULL,
    [ges_estado_gst] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [ges_sub_estado_gst] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [ges_fecha_compromete] datetime NULL,
    [ges_descripcion_gst] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [ges_fecha_accion] datetime NOT NULL,
    [ges_ejecutivo_rut] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [ges_oficina] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
)