IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_TipologiaGestion]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_TipologiaGestion]
(
    [Id] int NOT NULL IDENTITY(1, 1),
    [IdTema] int NULL,
    [GlosaGestion] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
)