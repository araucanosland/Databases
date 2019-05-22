IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_CabeceraGestionMantencion]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_CabeceraGestionMantencion]
(
    [IdCabGesMantencion] int NOT NULL IDENTITY(1, 1),
    [RutEmpresa] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [Tipo] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [Comentarios] varchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [RutEjeIngreso] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaIngreso] datetime NULL,
    [CodigoSucursal] int NULL,
    [CodigoAnexo] int NULL,
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[carteras].[TabCart_CabeceraGestionMantencion]') AND name = 'INDEX_BUSQ_IDMANTENCION')
CREATE NONCLUSTERED INDEX [INDEX_BUSQ_IDMANTENCION] ON [carteras].[TabCart_CabeceraGestionMantencion]([IdCabGesMantencion] ASC)