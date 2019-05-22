IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_CabeceraEntrevista]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_CabeceraEntrevista]
(
    [IdEntrevista] int NOT NULL IDENTITY(1, 1),
    [RutEmpresa] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaEntrevista] datetime NULL,
    [NombreContacto] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [Estamento] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [Cargo] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [TelefonoContacto] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
    [CorreoContacto] varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
    [Comentarios] varchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [RutEjeIngreso] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaIngreso] datetime NULL,
    [CodigoSucursal] int NULL,
    [CodigoAnexo] int NULL,
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[carteras].[TabCart_CabeceraEntrevista]') AND name = 'INDEX_BUSQ_IDENTREVISTA')
CREATE NONCLUSTERED INDEX [INDEX_BUSQ_IDENTREVISTA] ON [carteras].[TabCart_CabeceraEntrevista]([IdEntrevista] ASC)