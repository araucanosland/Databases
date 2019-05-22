IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[TabSca_Permisos]') AND type = 'U')
CREATE TABLE [security].[TabSca_Permisos]
(
    [CodPermiso] int NOT NULL IDENTITY(1, 1),
    [CodRecurso] int NOT NULL,
    [CodRol] int NOT NULL,
    CONSTRAINT [PK__TabSca_P__E749BDC649AEE81E] PRIMARY KEY CLUSTERED ([CodPermiso] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[security].[FK_PERMRECURSO]') AND parent_object_id = OBJECT_ID('[security].[TabSca_Permisos]'))
BEGIN
    ALTER TABLE [security].[TabSca_Permisos] WITH CHECK ADD CONSTRAINT [FK_PERMRECURSO] FOREIGN KEY ([CodRecurso]) REFERENCES [security].[TabSca_Recurso] ([CodRecurso])
    ALTER TABLE [security].[TabSca_Permisos] CHECK CONSTRAINT [FK_PERMRECURSO]
END

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[security].[FK_ROLPEEMISO]') AND parent_object_id = OBJECT_ID('[security].[TabSca_Permisos]'))
BEGIN
    ALTER TABLE [security].[TabSca_Permisos] WITH CHECK ADD CONSTRAINT [FK_ROLPEEMISO] FOREIGN KEY ([CodRol]) REFERENCES [security].[TabSca_Rol] ([CodRol])
    ALTER TABLE [security].[TabSca_Permisos] CHECK CONSTRAINT [FK_ROLPEEMISO]
END

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[security].[TabSca_Permisos]') AND name = 'UNQ_RESTRICT_DUPL_PERMISOS')
CREATE UNIQUE NONCLUSTERED INDEX [UNQ_RESTRICT_DUPL_PERMISOS] ON [security].[TabSca_Permisos](
    [CodRecurso] ASC,
    [CodRol] ASC
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[security].[TabSca_Permisos]') AND name = 'IDX_UNDASD')
CREATE NONCLUSTERED INDEX [IDX_UNDASD] ON [security].[TabSca_Permisos](
    [CodPermiso] ASC,
    [CodRecurso] ASC,
    [CodRol] ASC
)