IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_DetalleGestionMantencion]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_DetalleGestionMantencion]
(
    [IdGesMantencion] int NOT NULL IDENTITY(1, 1),
    [IdCabGesMantencion] int NULL,
    [RutEmpresa] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [Tema] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [SubTema] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [RutAfiliado] varchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [Comentarios] varchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [RutEjeIngreso] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaIngreso] datetime NULL,
    [Alerta] int NULL,
    [FlagActualizacion] int NULL,
    [IdDetalleOrigen] int NULL,
)