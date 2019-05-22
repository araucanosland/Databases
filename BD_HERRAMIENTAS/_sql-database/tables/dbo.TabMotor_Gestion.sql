IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Gestion]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Gestion]
(
    [ges_bcam_uid] int NOT NULL,
    [ges_fecha_accion] datetime NOT NULL,
    [ges_fecha_compromete] datetime NULL,
    [ges_estado_gst] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [ges_descripcion_gst] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [ges_ejecutivo_rut] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [ges_oficina] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabMotor__4E7288B642E1EEFE] PRIMARY KEY CLUSTERED 
    (
        [ges_bcam_uid] ASC,
        [ges_fecha_accion] ASC
    )
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Gestion]') AND name = 'DX3')
CREATE NONCLUSTERED INDEX [DX3] ON [dbo].[TabMotor_Gestion](
    [ges_bcam_uid] ASC,
    [ges_estado_gst] ASC
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Gestion]') AND name = 'DX4')
CREATE NONCLUSTERED INDEX [DX4] ON [dbo].[TabMotor_Gestion](
    [ges_bcam_uid] ASC,
    [ges_fecha_accion] ASC
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Gestion]') AND name = 'IDX_ID_ASIGNACION')
CREATE NONCLUSTERED INDEX [IDX_ID_ASIGNACION] ON [dbo].[TabMotor_Gestion]([ges_bcam_uid] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Gestion]') AND name = 'IDX_MATCH_ASG')
CREATE NONCLUSTERED INDEX [IDX_MATCH_ASG] ON [dbo].[TabMotor_Gestion](
    [ges_bcam_uid] ASC,
    [ges_ejecutivo_rut] ASC
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Gestion]') AND name = 'IDX_RUT')
CREATE NONCLUSTERED INDEX [IDX_RUT] ON [dbo].[TabMotor_Gestion]([ges_ejecutivo_rut] ASC)