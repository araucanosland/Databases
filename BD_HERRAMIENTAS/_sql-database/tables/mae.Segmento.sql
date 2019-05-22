IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[Segmento]') AND type = 'U')
CREATE TABLE [mae].[Segmento]
(
    [Id_Segmento] int NOT NULL IDENTITY(1, 1),
    [RolSegmentoAfiliado] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    CONSTRAINT [PK__Segmento__668262601FB8AE52] PRIMARY KEY CLUSTERED ([Id_Segmento] ASC)
)