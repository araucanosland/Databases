IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_TipoCampagna]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_TipoCampagna]
(
    [tcam_id] int NOT NULL IDENTITY(1, 1),
    [tcam_nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    CONSTRAINT [PK__TabMotor__E3CE99A03F115E1A] PRIMARY KEY CLUSTERED ([tcam_id] ASC)
)