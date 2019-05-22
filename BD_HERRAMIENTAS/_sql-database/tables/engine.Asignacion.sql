IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[Asignacion]') AND type = 'U')
CREATE TABLE [engine].[Asignacion]
(
    [CodAsignacion] bigint NOT NULL IDENTITY(1, 1),
    [CodCamp] int NOT NULL,
    [RutEntidad] int NOT NULL,
    [RutEjecutivo] varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
    [CodOficina] int NOT NULL,
    [CampoClaveDuplicados] varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
    [Activa] bit NULL DEFAULT((1)),
    CONSTRAINT [PK__Asignaci__8BD0C55266603565] PRIMARY KEY CLUSTERED ([CodAsignacion] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[engine].[FK_CAMPASIGNA]') AND parent_object_id = OBJECT_ID('[engine].[Asignacion]'))
BEGIN
    ALTER TABLE [engine].[Asignacion] WITH CHECK ADD CONSTRAINT [FK_CAMPASIGNA] FOREIGN KEY ([CodCamp]) REFERENCES [engine].[Campaña] ([CodCamp])
    ALTER TABLE [engine].[Asignacion] CHECK CONSTRAINT [FK_CAMPASIGNA]
END

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[engine].[FK_ENTIDADASIGNA]') AND parent_object_id = OBJECT_ID('[engine].[Asignacion]'))
BEGIN
    ALTER TABLE [engine].[Asignacion] WITH CHECK ADD CONSTRAINT [FK_ENTIDADASIGNA] FOREIGN KEY ([RutEntidad]) REFERENCES [engine].[Entidad] ([RutEntidad])
    ALTER TABLE [engine].[Asignacion] CHECK CONSTRAINT [FK_ENTIDADASIGNA]
END

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[engine].[Asignacion]') AND name = 'BUSQIDX_CAMPNA')
CREATE NONCLUSTERED INDEX [BUSQIDX_CAMPNA] ON [engine].[Asignacion](
    [CodAsignacion] ASC,
    [CodCamp] ASC,
    [RutEjecutivo] ASC,
    [CodOficina] ASC
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[engine].[Asignacion]') AND name = 'MATCH_EJX')
CREATE NONCLUSTERED INDEX [MATCH_EJX] ON [engine].[Asignacion]([RutEjecutivo] ASC)