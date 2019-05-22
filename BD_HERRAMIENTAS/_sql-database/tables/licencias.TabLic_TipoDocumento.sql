IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[TabLic_TipoDocumento]') AND type = 'U')
CREATE TABLE [licencias].[TabLic_TipoDocumento]
(
    [CodTipoDoc] int NOT NULL IDENTITY(1, 1),
    [Nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabLic_T__1002C2E717236851] PRIMARY KEY CLUSTERED ([CodTipoDoc] ASC)
)