IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[scafi].[TabMotor_Contactibilidad_OLD]') AND type = 'U')
CREATE TABLE [scafi].[TabMotor_Contactibilidad_OLD]
(
    [RutAfiliado] int NOT NULL,
    [RutAfiliadoDv] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [TipoContacto] varchar(10) COLLATE Modern_Spanish_CI_AS NULL,
    [ClasificacionContacto] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Valor] varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
    [Origen] varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaCreacion] datetime NULL,
    [FechaIntento] datetime NULL,
    [FechaContacto] datetime NULL,
    [FechaBaja] datetime NULL,
    [OrigenBaja] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [RutEjecutivoGestion] varchar(12) COLLATE Modern_Spanish_CI_AS NULL,
    [Oficina] int NULL,
)