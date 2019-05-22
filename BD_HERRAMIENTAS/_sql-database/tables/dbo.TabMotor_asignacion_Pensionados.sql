IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_asignacion_Pensionados]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_asignacion_Pensionados]
(
    [id_Asign] int NOT NULL,
    [RUTPEN] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [NOMBREPEN] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [FECNAC] int NULL,
    [CALLE] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [NUMERO] float NULL,
    [RESTO_DIRECCION] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [COMUNA] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [CIUDAD] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [REGION] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [FONOPARTICULAR] float NULL,
    [FONOCELULAR] float NULL,
    [EMAIL] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [PRIORIDAD] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [PREAPROBADO] int NOT NULL,
    [CODOFICINA] float NULL,
    [SUCURSAL_SUGERIDA] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [RUTEJECUTIVO] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [PERCAMPAÑA] int NOT NULL,
    [flagActDir] int NULL,
    [ESTADO_GESTION] int NULL,
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_asignacion_Pensionados]') AND name = 'INDEX_PENS_RUT')
CREATE NONCLUSTERED INDEX [INDEX_PENS_RUT] ON [dbo].[TabMotor_asignacion_Pensionados]([RUTPEN] ASC)