IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_DetalleEntrevistax]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_DetalleEntrevistax]
(
    [IdDetalleEntrevista] int NOT NULL,
    [IdEntrevista] int NULL,
    [Tema] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [SubTema] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [Semaforo] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [Alerta] int NULL,
    [Compromiso] int NULL,
    [FechaResolucion] datetime NULL,
    [Comentarios] varchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [RutEjeIngreso] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaIngreso] datetime NULL,
    [FlagActualizacion] int NULL,
    [IdDetalleOrigen] int NULL,
)