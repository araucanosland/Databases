IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_AnexoEmpresax]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_AnexoEmpresax]
(
    [IdEmpresaAnexo] int NOT NULL,
    [RutEmpresa] varchar(12) COLLATE Modern_Spanish_CI_AS NULL,
    [NombreEmpresa] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Anexo] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [NumTrabajadores] int NULL,
    [CodOficina] int NULL,
    [IdComuna] int NULL,
    [NombreComuna] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Direccion] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [RutAgenteIngreso] varchar(12) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaCreacion] datetime NULL,
    [EsMatriz] bit NOT NULL,
)