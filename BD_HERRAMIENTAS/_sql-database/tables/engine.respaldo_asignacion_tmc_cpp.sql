IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[respaldo_asignacion_tmc_cpp]') AND type = 'U')
CREATE TABLE [engine].[respaldo_asignacion_tmc_cpp]
(
    [CodAsignacion] bigint NOT NULL IDENTITY(1, 1),
    [CodCamp] int NOT NULL,
    [RutEntidad] int NOT NULL,
    [RutEjecutivo] varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
    [CodOficina] int NOT NULL,
    [CampoClaveDuplicados] varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
    [Activa] bit NULL,
)