IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_CarteraEmpresasx]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_CarteraEmpresasx]
(
    [IdSucursalEmpresa] int NOT NULL,
    [RutEmpresa] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [NombreEmpresa] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [CodOficina] int NULL,
    [NTrabajador] int NULL,
    [Holding] int NULL,
    [EjecutivoIngreso] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [TipoEmpresa] int NULL,
    [Id_EmpresaAdmin] int NULL,
)