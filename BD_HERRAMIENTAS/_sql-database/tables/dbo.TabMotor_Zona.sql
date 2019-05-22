IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Zona]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Zona]
(
    [zna_id] int NOT NULL IDENTITY(1, 1),
    [zna_nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabMotor__A46C4B8F2B0A656D] PRIMARY KEY CLUSTERED ([zna_id] ASC)
)