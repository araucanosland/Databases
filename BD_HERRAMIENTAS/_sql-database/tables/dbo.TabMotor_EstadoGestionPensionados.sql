IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_EstadoGestionPensionados]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_EstadoGestionPensionados]
(
    [eges_id] int NOT NULL,
    [eges_nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [ejes_id_padre] bigint NULL,
    [ejes_terminal] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [ejes_tipo_campagna] int NULL,
    CONSTRAINT [PK__TabMotor__F0EF12F45E1FF51F] PRIMARY KEY CLUSTERED ([eges_id] ASC)
)