IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[TabSca_Recurso]') AND type = 'U')
CREATE TABLE [security].[TabSca_Recurso]
(
    [CodRecurso] int NOT NULL IDENTITY(1, 1),
    [Nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Descripcion] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    CONSTRAINT [PK__TabSca_R__85DA609E4E739D3B] PRIMARY KEY CLUSTERED ([CodRecurso] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[security].[TabSca_Recurso]') AND name = 'IDX_RECCOD')
CREATE NONCLUSTERED INDEX [IDX_RECCOD] ON [security].[TabSca_Recurso]([CodRecurso] ASC)