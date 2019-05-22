IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Feriados]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Feriados]
(
    [Fecha] date NOT NULL,
    [Descripcion] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabMotor__B30C8A5F61F08603] PRIMARY KEY CLUSTERED ([Fecha] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Feriados]') AND name = 'IDX_FRIADO')
CREATE NONCLUSTERED INDEX [IDX_FRIADO] ON [dbo].[TabMotor_Feriados]([Fecha] ASC)