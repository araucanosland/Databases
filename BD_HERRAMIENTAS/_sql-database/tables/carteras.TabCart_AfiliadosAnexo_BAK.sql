IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_AfiliadosAnexo_BAK]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_AfiliadosAnexo_BAK]
(
    [IdAnexo] int NULL,
    [RutAfiliado] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
)