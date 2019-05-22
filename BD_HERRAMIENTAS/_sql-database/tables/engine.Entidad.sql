IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[Entidad]') AND type = 'U')
CREATE TABLE [engine].[Entidad]
(
    [RutEntidad] int NOT NULL,
    [DvEntidad] varchar(2) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [NombreEntidad] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [EsPersonalidadJuridica] bit NOT NULL DEFAULT((0)),
    CONSTRAINT [PK__Entidad__14594E7E7F60ED59] PRIMARY KEY CLUSTERED ([RutEntidad] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[engine].[Entidad]') AND name = 'IDXBQ_RUT')
CREATE NONCLUSTERED INDEX [IDXBQ_RUT] ON [engine].[Entidad]([RutEntidad] ASC)