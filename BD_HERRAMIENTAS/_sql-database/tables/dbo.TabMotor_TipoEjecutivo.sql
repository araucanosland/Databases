IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_TipoEjecutivo]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_TipoEjecutivo]
(
    [tejec_id] int NOT NULL IDENTITY(1, 1),
    [tejec_nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabMotor__6DBBE60237703C52] PRIMARY KEY CLUSTERED ([tejec_id] ASC)
)