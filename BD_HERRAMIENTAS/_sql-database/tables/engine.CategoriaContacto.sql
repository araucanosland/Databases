IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[CategoriaContacto]') AND type = 'U')
CREATE TABLE [engine].[CategoriaContacto]
(
    [CodCategoria] int NOT NULL IDENTITY(1, 1),
    [NombreCategoria] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    CONSTRAINT [PK__Categori__3D488B9008EA5793] PRIMARY KEY CLUSTERED ([CodCategoria] ASC)
)