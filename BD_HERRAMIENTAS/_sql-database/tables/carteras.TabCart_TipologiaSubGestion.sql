IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_TipologiaSubGestion]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_TipologiaSubGestion]
(
    [Id] int NOT NULL IDENTITY(1, 1),
    [IdTema] int NULL,
    [IdSubTema] int NULL,
    [GlosaSubTema] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
)