IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[Empresas]') AND type = 'U')
CREATE TABLE [mae].[Empresas]
(
    [idFechaCorte] date NOT NULL,
    [RutEmpresa] numeric NULL,
    [DvEmpresa] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [NombreEmpresa] varchar(45) COLLATE Modern_Spanish_CI_AS NULL,
    [NombreHolding] varchar(30) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [TipoEmpresa] varchar(10) COLLATE Modern_Spanish_CI_AS NULL,
    [EmprIniVigencia] date NULL,
    [EmprFinVigencia] date NULL,
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[mae].[Empresas]') AND name = 'idx_RutEmpre')
CREATE NONCLUSTERED INDEX [idx_RutEmpre] ON [mae].[Empresas]([RutEmpresa] ASC)