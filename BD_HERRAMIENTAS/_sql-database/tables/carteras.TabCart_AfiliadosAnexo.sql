IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_AfiliadosAnexo]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_AfiliadosAnexo]
(
    [IdAnexo] int NULL,
    [RutAfiliado] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[carteras].[TabCart_AfiliadosAnexo]') AND name = 'IDX_BUSQ_ANEXO')
CREATE NONCLUSTERED INDEX [IDX_BUSQ_ANEXO] ON [carteras].[TabCart_AfiliadosAnexo]([IdAnexo] ASC)