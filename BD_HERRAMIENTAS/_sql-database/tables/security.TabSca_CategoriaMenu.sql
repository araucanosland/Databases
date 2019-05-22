IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[TabSca_CategoriaMenu]') AND type = 'U')
CREATE TABLE [security].[TabSca_CategoriaMenu]
(
    [CodCategoria] int NOT NULL IDENTITY(1, 1),
    [Nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Orden] int NOT NULL DEFAULT((0)),
    CONSTRAINT [PK__TabSca_C__3D488B903E3D3572] PRIMARY KEY CLUSTERED ([CodCategoria] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[security].[TabSca_CategoriaMenu]') AND name = 'IDXBQ_ARLL')
CREATE NONCLUSTERED INDEX [IDXBQ_ARLL] ON [security].[TabSca_CategoriaMenu](
    [CodCategoria] ASC,
    [Orden] ASC
)