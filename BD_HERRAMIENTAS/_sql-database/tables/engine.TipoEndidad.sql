IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[TipoEndidad]') AND type = 'U')
CREATE TABLE [engine].[TipoEndidad]
(
    [CodTipoEntidad] int NOT NULL IDENTITY(1, 1),
    [NombreTipoEntidad] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    CONSTRAINT [PK__TipoEndi__6B72A1BE182C9B23] PRIMARY KEY CLUSTERED ([CodTipoEntidad] ASC)
)