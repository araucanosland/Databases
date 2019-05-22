IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_EjecAsignacionEmpresa]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_EjecAsignacionEmpresa]
(
    [IdEmpresaAsigEjec] int NOT NULL IDENTITY(1, 1),
    [IdSucursalEmpresa] int NULL,
    [RutEjectAsignado] varchar(12) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaAsignacion] datetime NULL,
    CONSTRAINT [PK__TabCart___C21C3D1A2116E6DF] PRIMARY KEY CLUSTERED ([IdEmpresaAsigEjec] ASC)
)