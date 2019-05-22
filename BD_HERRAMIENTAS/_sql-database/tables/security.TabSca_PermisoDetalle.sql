IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[TabSca_PermisoDetalle]') AND type = 'U')
CREATE TABLE [security].[TabSca_PermisoDetalle]
(
    [CodPerDetalle] int NOT NULL IDENTITY(1, 1),
    [CodPermiso] int NULL,
    [Controlador] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Accion] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabSca_P__42B76FD645DE573A] PRIMARY KEY CLUSTERED ([CodPerDetalle] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[security].[FK_PERMISODET]') AND parent_object_id = OBJECT_ID('[security].[TabSca_PermisoDetalle]'))
BEGIN
    ALTER TABLE [security].[TabSca_PermisoDetalle] WITH CHECK ADD CONSTRAINT [FK_PERMISODET] FOREIGN KEY ([CodPermiso]) REFERENCES [security].[TabSca_Permisos] ([CodPermiso])
    ALTER TABLE [security].[TabSca_PermisoDetalle] CHECK CONSTRAINT [FK_PERMISODET]
END

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[security].[TabSca_PermisoDetalle]') AND name = 'IDX_HTTP')
CREATE NONCLUSTERED INDEX [IDX_HTTP] ON [security].[TabSca_PermisoDetalle](
    [Controlador] ASC,
    [Accion] ASC
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[security].[TabSca_PermisoDetalle]') AND name = 'IDXBSQ_ALL')
CREATE NONCLUSTERED INDEX [IDXBSQ_ALL] ON [security].[TabSca_PermisoDetalle](
    [CodPerDetalle] ASC,
    [CodPermiso] ASC,
    [Controlador] ASC,
    [Accion] ASC
)