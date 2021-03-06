IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_Agenda_Empresa]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_Agenda_Empresa]
(
    [IdAgenda] int NOT NULL IDENTITY(1, 1),
    [IdRegistro] int NULL,
    [RutEmpresa] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [NombreEmpresa] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [RutEjecutivo] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [Glosa] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaInico] datetime NULL,
    [FechaFin] datetime NULL,
    [HoraInicio] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [HoraFin] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [Frecuencia] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
    [Dias] varchar(800) COLLATE Modern_Spanish_CI_AS NULL,
    [DiasSucede] int NULL,
    [TipoVisita] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [CodOficina] int NULL,
    [IdAnexo] int NULL,
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[carteras].[TabCart_Agenda_Empresa]') AND name = 'INDEX_BUSQ_IDAGENDA')
CREATE NONCLUSTERED INDEX [INDEX_BUSQ_IDAGENDA] ON [carteras].[TabCart_Agenda_Empresa]([IdAgenda] ASC)