IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_CarteraEmpresas]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_CarteraEmpresas]
(
    [IdSucursalEmpresa] int NOT NULL IDENTITY(1, 1),
    [RutEmpresa] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [NombreEmpresa] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [CodOficina] int NULL,
    [NTrabajador] int NULL,
    [Holding] int NULL,
    [EjecutivoIngreso] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [TipoEmpresa] int NULL,
    [Id_EmpresaAdmin] int NULL,
    CONSTRAINT [PK__TabCart___7837B2430FEC5ADD] PRIMARY KEY CLUSTERED ([IdSucursalEmpresa] ASC)
)