IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[TabSca_Menu]') AND type = 'U')
CREATE TABLE [security].[TabSca_Menu]
(
    [CodMenu] int NOT NULL IDENTITY(1, 1),
    [CodRecurso] int NULL,
    [CodMenuPadre] int NULL,
    [Enlace] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Icono] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
    [Orden] int NOT NULL,
    [CodCategoria] int NULL,
    [Activo] bit NOT NULL DEFAULT((1)),
    CONSTRAINT [PK__TabSca_M__0ADA2B18420DC656] PRIMARY KEY CLUSTERED ([CodMenu] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[security].[FK_CATMENU]') AND parent_object_id = OBJECT_ID('[security].[TabSca_Menu]'))
BEGIN
    ALTER TABLE [security].[TabSca_Menu] WITH CHECK ADD CONSTRAINT [FK_CATMENU] FOREIGN KEY ([CodCategoria]) REFERENCES [security].[TabSca_CategoriaMenu] ([CodCategoria])
    ALTER TABLE [security].[TabSca_Menu] CHECK CONSTRAINT [FK_CATMENU]
END

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[security].[FK_RECMENU]') AND parent_object_id = OBJECT_ID('[security].[TabSca_Menu]'))
BEGIN
    ALTER TABLE [security].[TabSca_Menu] WITH CHECK ADD CONSTRAINT [FK_RECMENU] FOREIGN KEY ([CodRecurso]) REFERENCES [security].[TabSca_Recurso] ([CodRecurso])
    ALTER TABLE [security].[TabSca_Menu] CHECK CONSTRAINT [FK_RECMENU]
END

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[security].[TabSca_Menu]') AND name = 'IDX_CDMEN')
CREATE NONCLUSTERED INDEX [IDX_CDMEN] ON [security].[TabSca_Menu](
    [CodMenu] ASC,
    [CodRecurso] ASC,
    [CodMenuPadre] ASC,
    [CodCategoria] ASC
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[security].[TabSca_Menu]') AND name = 'IDX_RX')
CREATE NONCLUSTERED INDEX [IDX_RX] ON [security].[TabSca_Menu]([CodRecurso] ASC)