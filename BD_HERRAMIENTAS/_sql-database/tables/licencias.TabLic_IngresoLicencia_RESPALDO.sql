IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[TabLic_IngresoLicencia_RESPALDO]') AND type = 'U')
CREATE TABLE [licencias].[TabLic_IngresoLicencia_RESPALDO]
(
    [CodIngreso] bigint NOT NULL IDENTITY(1, 1),
    [RutAfiliado] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [FolioLicencia] varchar(100) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Oficina] int NOT NULL,
    [RutEjecutivo] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [CodEstado] int NOT NULL,
    [FechaIngreso] datetime NOT NULL,
    [CantidadDiasLM] int NULL,
    [FechaInicioLM] datetime NULL,
    [FechaHastaLM] datetime NULL,
    [TipoLM] int NULL,
    [NombreAfiliado] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [SinDatosEnSistema] bit NULL,
    [FormatoLM] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [FlagLM] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [FlagEstado] int NULL,
    [OficinaDerivada] int NULL,
)