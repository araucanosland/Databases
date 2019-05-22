IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[TabLic_IngresoLicencia_desa]') AND type = 'U')
CREATE TABLE [licencias].[TabLic_IngresoLicencia_desa]
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
    [SinDatosEnSistema] bit NULL DEFAULT((0)),
    [FormatoLM] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [FlagLM] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [FlagEstado] int NULL,
    [OficinaDerivada] int NULL,
    CONSTRAINT [PK__TabLic_I__F053C45410766AC2] PRIMARY KEY CLUSTERED ([CodIngreso] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[licencias].[FKLC_ESTATUSLC_DESA]') AND parent_object_id = OBJECT_ID('[licencias].[TabLic_IngresoLicencia_desa]'))
BEGIN
    ALTER TABLE [licencias].[TabLic_IngresoLicencia_desa] WITH CHECK ADD CONSTRAINT [FKLC_ESTATUSLC_DESA] FOREIGN KEY ([CodEstado]) REFERENCES [licencias].[TabLic_EstadoLicencia] ([CodEstado])
    ALTER TABLE [licencias].[TabLic_IngresoLicencia_desa] CHECK CONSTRAINT [FKLC_ESTATUSLC_DESA]
END