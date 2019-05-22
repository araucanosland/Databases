IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[EstadoGestion]') AND type = 'U')
CREATE TABLE [engine].[EstadoGestion]
(
    [CodEstado] int NOT NULL IDENTITY(1, 1),
    [Nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [CodEstPadre] int NULL,
    [EsTerminal] bit NOT NULL,
    [CodCamp] int NOT NULL,
    CONSTRAINT [PK__EstadoGe__EA1A0FCC6E01572D] PRIMARY KEY CLUSTERED ([CodEstado] ASC)
)