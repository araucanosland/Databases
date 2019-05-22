IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_EstadoGestion]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_EstadoGestion]
(
    [eges_id] int NOT NULL,
    [eges_nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [ejes_id_padre] bigint NULL,
    [ejes_terminal] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [ejes_tipo_campagna] int NULL,
    CONSTRAINT [PK__TabMotor__F0EF12F446B27FE2] PRIMARY KEY CLUSTERED ([eges_id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_EstadoGestion]') AND name = 'IDX_BUSC_PADRE')
CREATE NONCLUSTERED INDEX [IDX_BUSC_PADRE] ON [dbo].[TabMotor_EstadoGestion]([ejes_id_padre] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_EstadoGestion]') AND name = 'IDX_BUSQ_ID')
CREATE NONCLUSTERED INDEX [IDX_BUSQ_ID] ON [dbo].[TabMotor_EstadoGestion]([eges_id] ASC)