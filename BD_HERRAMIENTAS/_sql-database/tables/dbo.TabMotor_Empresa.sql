IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Empresa]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Empresa]
(
    [id_Empresa] int NOT NULL IDENTITY(1, 1),
    [Periodo] varchar(10) COLLATE Modern_Spanish_CI_AS NULL,
    [Empresa_Rut] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [Empresa_Dv] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [Empresa_Nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Ejec_Rut] int NULL,
    [Ejec_Dv] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [Empresa_Tipo] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [Empresa_Clasificacion] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [Cod_Sucursal] int NULL,
    [Holding] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [Sucursal] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [Estado] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [Reasing_Observacion] varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
    [Reasing_Flag] int NULL,
    [Resing_CodsucursalAnterior] int NULL,
    CONSTRAINT [PK_TabMotor_Empresa] PRIMARY KEY CLUSTERED ([id_Empresa] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Empresa]') AND name = 'IDX_PERIRUT')
CREATE NONCLUSTERED INDEX [IDX_PERIRUT] ON [dbo].[TabMotor_Empresa](
    [Periodo] ASC,
    [Empresa_Rut] ASC,
    [Cod_Sucursal] ASC
)