IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[Gestion]') AND type = 'U')
CREATE TABLE [engine].[Gestion]
(
    [CodGestion] bigint NOT NULL IDENTITY(1, 1),
    [CodAsignacion] bigint NOT NULL,
    [FechaAccion] datetime NOT NULL,
    [FechaCompromiso] datetime NULL,
    [CodEstadoGestion] int NOT NULL,
    [NotaGestion] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [RutEjecutivo] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [CodOficina] int NULL,
    CONSTRAINT [PK__Gestion__419B6C796A30C649] PRIMARY KEY CLUSTERED ([CodGestion] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[engine].[FK_GSTASIN]') AND parent_object_id = OBJECT_ID('[engine].[Gestion]'))
BEGIN
    ALTER TABLE [engine].[Gestion] WITH CHECK ADD CONSTRAINT [FK_GSTASIN] FOREIGN KEY ([CodAsignacion]) REFERENCES [engine].[Asignacion] ([CodAsignacion])
    ALTER TABLE [engine].[Gestion] CHECK CONSTRAINT [FK_GSTASIN]
END

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[engine].[FK_ESTGASTR]') AND parent_object_id = OBJECT_ID('[engine].[Gestion]'))
BEGIN
    ALTER TABLE [engine].[Gestion] WITH CHECK ADD CONSTRAINT [FK_ESTGASTR] FOREIGN KEY ([CodEstadoGestion]) REFERENCES [engine].[EstadoGestion] ([CodEstado])
    ALTER TABLE [engine].[Gestion] CHECK CONSTRAINT [FK_ESTGASTR]
END

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[engine].[Gestion]') AND name = 'dasdada')
CREATE NONCLUSTERED INDEX [dasdada] ON [engine].[Gestion](
    [CodGestion] ASC,
    [CodAsignacion] ASC
)