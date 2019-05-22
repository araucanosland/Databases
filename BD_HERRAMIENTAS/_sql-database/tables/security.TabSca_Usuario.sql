IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[TabSca_Usuario]') AND type = 'U')
CREATE TABLE [security].[TabSca_Usuario]
(
    [usr_id] int NOT NULL IDENTITY(1, 1),
    [usr_nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [usr_clave] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [usr_rut] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [usr_noticia_inicio] int NOT NULL DEFAULT((0)),
    [usr_tipo] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
    [usr_instalacion] int NOT NULL DEFAULT((0)),
    [usr_estado_clave] int NULL,
    [usr_dominio] varchar(100) COLLATE Modern_Spanish_CI_AS NULL DEFAULT(NULL),
    CONSTRAINT [PK__TabSca_U__60621ABC57FD0775] PRIMARY KEY CLUSTERED ([usr_id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[security].[TabSca_Usuario]') AND name = 'IDX_BUSQ_RUT')
CREATE NONCLUSTERED INDEX [IDX_BUSQ_RUT] ON [security].[TabSca_Usuario]([usr_rut] ASC)