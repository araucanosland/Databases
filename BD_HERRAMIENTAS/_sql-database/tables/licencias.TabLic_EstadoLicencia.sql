IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[TabLic_EstadoLicencia]') AND type = 'U')
CREATE TABLE [licencias].[TabLic_EstadoLicencia]
(
    [CodEstado] int NOT NULL IDENTITY(1, 1),
    [Nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabLic_E__EA1A0FCC08D548FA] PRIMARY KEY CLUSTERED ([CodEstado] ASC)
)