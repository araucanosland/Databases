IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_IngresoContacto]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_IngresoContacto]
(
    [IdContactoEmpresa] int NOT NULL IDENTITY(1, 1),
    [RutEmpresa] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [IdAnexo] int NULL,
    [IdEstamento] int NULL,
    [RutContacto] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [NombreContacto] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [CargoContacto] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [TelefonoContacto] int NULL,
    [CelularContacto] int NULL,
    [EmailContacto] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaIngresoContacto] datetime NULL,
    CONSTRAINT [PK__TabCart___04D9EBC42E70E1FD] PRIMARY KEY CLUSTERED ([IdContactoEmpresa] ASC)
)