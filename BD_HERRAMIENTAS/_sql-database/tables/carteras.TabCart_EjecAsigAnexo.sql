IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_EjecAsigAnexo]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_EjecAsigAnexo]
(
    [IdEjecAsigAnexo] int NOT NULL IDENTITY(1, 1),
    [IdEmpresaAnexo] int NULL,
    [RutEjecutivoAsigAnexo] varchar(11) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaAsignacion] datetime NULL,
    CONSTRAINT [PK__TabCart___B06344681975C517] PRIMARY KEY CLUSTERED ([IdEjecAsigAnexo] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[carteras].[TabCart_EjecAsigAnexo]') AND name = 'IDX_COD_ANEXO')
CREATE NONCLUSTERED INDEX [IDX_COD_ANEXO] ON [carteras].[TabCart_EjecAsigAnexo]([IdEmpresaAnexo] ASC)