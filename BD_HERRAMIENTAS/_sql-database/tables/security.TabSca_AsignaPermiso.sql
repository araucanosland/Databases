IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[TabSca_AsignaPermiso]') AND type = 'U')
CREATE TABLE [security].[TabSca_AsignaPermiso]
(
    [CodPermiso] int NOT NULL,
    [Grupo] varchar(100) COLLATE Modern_Spanish_CI_AS NOT NULL,
    CONSTRAINT [PK__TabSca_A__4A4984FA3A6CA48E] PRIMARY KEY CLUSTERED 
    (
        [CodPermiso] ASC,
        [Grupo] ASC
    )
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[security].[FK_PERMITEGRP]') AND parent_object_id = OBJECT_ID('[security].[TabSca_AsignaPermiso]'))
BEGIN
    ALTER TABLE [security].[TabSca_AsignaPermiso] WITH CHECK ADD CONSTRAINT [FK_PERMITEGRP] FOREIGN KEY ([CodPermiso]) REFERENCES [security].[TabSca_Permisos] ([CodPermiso])
    ALTER TABLE [security].[TabSca_AsignaPermiso] CHECK CONSTRAINT [FK_PERMITEGRP]
END

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[security].[TabSca_AsignaPermiso]') AND name = 'IDC')
CREATE NONCLUSTERED INDEX [IDC] ON [security].[TabSca_AsignaPermiso]([Grupo] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[security].[TabSca_AsignaPermiso]') AND name = 'IDXBQ_PALL')
CREATE NONCLUSTERED INDEX [IDXBQ_PALL] ON [security].[TabSca_AsignaPermiso](
    [CodPermiso] ASC,
    [Grupo] ASC
)