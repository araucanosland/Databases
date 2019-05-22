IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_CabeceraGestionMantencionx]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_CabeceraGestionMantencionx]
(
    [IdCabGesMantencion] int NOT NULL,
    [RutEmpresa] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [Tipo] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [Comentarios] varchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [RutEjeIngreso] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaIngreso] datetime NULL,
    [CodigoSucursal] int NULL,
    [CodigoAnexo] int NULL,
)