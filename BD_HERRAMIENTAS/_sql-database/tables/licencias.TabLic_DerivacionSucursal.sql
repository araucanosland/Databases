IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[TabLic_DerivacionSucursal]') AND type = 'U')
CREATE TABLE [licencias].[TabLic_DerivacionSucursal]
(
    [IdDerivacion] int NOT NULL IDENTITY(1, 1),
    [RutAfiliado] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [FolioLicencia] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Fecha_Derivacion] datetime NOT NULL,
    [Fecha_PrimerIngreso] datetime NOT NULL,
    [Sucursal_Origen] int NOT NULL,
    [Sucursal_Derivacion] int NOT NULL,
    [RutEjecutivo_Origen] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [RutEjecutivo_Derivacion] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
)