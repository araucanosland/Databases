IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[scafi].[TabMotor_Contactibilidad]') AND type = 'U')
CREATE TABLE [scafi].[TabMotor_Contactibilidad]
(
    [RutAfiliado] numeric NULL,
    [iTipoDato] int NULL,
    [TipoDato] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [iClasifDato] int NULL,
    [ClasifDato] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [ValorDato] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaCreacion] datetime NULL,
    [OrigenCreacion] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaIntento] datetime NULL,
    [ResultIntento] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [OrigenIntento] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaContacto] datetime NULL,
    [OrigenContacto] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaBaja] datetime NULL,
    [OrigenBaja] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [MotivoBaja] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [RutEjecGEstion] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [Oficina] int NULL,
    [IndiceContactab] int NULL,
    [Ocultar] int NULL,
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[scafi].[TabMotor_Contactibilidad]') AND name = 'idx_limpieza')
CREATE NONCLUSTERED INDEX [idx_limpieza] ON [scafi].[TabMotor_Contactibilidad](
    [Ocultar] ASC,
    [iTipoDato] ASC,
    [IndiceContactab] ASC
)