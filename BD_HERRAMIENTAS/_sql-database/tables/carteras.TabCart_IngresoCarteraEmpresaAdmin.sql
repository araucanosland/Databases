IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_IngresoCarteraEmpresaAdmin]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_IngresoCarteraEmpresaAdmin]
(
    [IdSucursalEmpresa] int NOT NULL IDENTITY(1, 1),
    [SucursalEmpresa] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [RutEmpresa] varchar(12) COLLATE Modern_Spanish_CI_AS NULL,
    [NombreEmpresa] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [CodOficina] int NULL,
    [NTrabajador] int NULL,
    [Holding] int NULL,
    [Comentarios] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaIngreso] datetime NULL,
    [EjecutivoIngreso] varchar(12) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabCart___7837B2432AA05119] PRIMARY KEY CLUSTERED ([IdSucursalEmpresa] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[carteras].[TabCart_IngresoCarteraEmpresaAdmin]') AND name = 'idxRutEmpresa')
CREATE UNIQUE NONCLUSTERED INDEX [idxRutEmpresa] ON [carteras].[TabCart_IngresoCarteraEmpresaAdmin](
    [RutEmpresa] ASC,
    [CodOficina] ASC
)