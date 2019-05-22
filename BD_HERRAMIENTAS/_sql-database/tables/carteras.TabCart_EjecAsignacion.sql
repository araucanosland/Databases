IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_EjecAsignacion]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_EjecAsignacion]
(
    [IdEjecAsignacion] int NOT NULL IDENTITY(1, 1),
    [IdSucursalEmpresa] int NULL,
    [RutEjecAsignado] varchar(12) COLLATE Modern_Spanish_CI_AS NULL,
    [NombreEjecAsignado] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabCart___7AF1DEF41D4655FB] PRIMARY KEY CLUSTERED ([IdEjecAsignacion] ASC)
)