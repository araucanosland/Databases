IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_AnexoEmpresa]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_AnexoEmpresa]
(
    [IdEmpresaAnexo] int NOT NULL IDENTITY(1, 1),
    [RutEmpresa] varchar(12) COLLATE Modern_Spanish_CI_AS NULL,
    [NombreEmpresa] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Anexo] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [NumTrabajadores] int NULL,
    [CodOficina] int NULL,
    [IdComuna] int NULL,
    [NombreComuna] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Direccion] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [RutAgenteIngreso] varchar(12) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaCreacion] datetime NULL,
    [EsMatriz] bit NOT NULL DEFAULT((0)),
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[carteras].[TabCart_AnexoEmpresa]') AND name = 'IDX_EMPRESA_ANEXO')
CREATE NONCLUSTERED INDEX [IDX_EMPRESA_ANEXO] ON [carteras].[TabCart_AnexoEmpresa](
    [IdEmpresaAnexo] ASC,
    [EsMatriz] ASC
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[carteras].[TabCart_AnexoEmpresa]') AND name = 'idx_RutAnexOfic')
CREATE NONCLUSTERED INDEX [idx_RutAnexOfic] ON [carteras].[TabCart_AnexoEmpresa](
    [RutEmpresa] ASC,
    [Anexo] ASC,
    [CodOficina] ASC
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[carteras].[TabCart_AnexoEmpresa]') AND name = 'INDEX_BUSQ_IDANEXO')
CREATE NONCLUSTERED INDEX [INDEX_BUSQ_IDANEXO] ON [carteras].[TabCart_AnexoEmpresa]([IdEmpresaAnexo] ASC)