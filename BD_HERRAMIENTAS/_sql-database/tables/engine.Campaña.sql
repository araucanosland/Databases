IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[Campaña]') AND type = 'U')
CREATE TABLE [engine].[Campaña]
(
    [CodCamp] int NOT NULL IDENTITY(1, 1),
    [IdentidadCamp] varchar(100) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Activa] bit NOT NULL DEFAULT((1)),
    CONSTRAINT [PK__Campaña__E0F8B39503317E3D] PRIMARY KEY CLUSTERED ([CodCamp] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[engine].[Campaña]') AND name = 'IDXV')
CREATE NONCLUSTERED INDEX [IDXV] ON [engine].[Campaña]([CodCamp] ASC)