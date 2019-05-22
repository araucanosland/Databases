IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_Empresas]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_Empresas]
(
    [idFechaCorte] date NOT NULL,
    [RutEmpresa] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [DvEmpresa] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [NombreEmpresa] varchar(45) COLLATE Modern_Spanish_CI_AS NULL,
    [NombreHolding] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [TipoEmpresa] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
)