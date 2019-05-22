IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Oficinas]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Oficinas]
(
    [Cod_Oficina] float NULL,
    [Oficina] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Oficinas]') AND name = 'idx_cod')
CREATE NONCLUSTERED INDEX [idx_cod] ON [dbo].[TabMotor_Oficinas]([Cod_Oficina] ASC)