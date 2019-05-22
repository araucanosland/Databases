IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_No_Molestar]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_No_Molestar]
(
    [Id_NoMolestar] int NOT NULL IDENTITY(1, 1),
    [RutAfiliado] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [Motivo] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [Fecha_iniEjec] datetime NULL,
    [RutEjecutivoIni] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [CodOficina_ini] int NULL,
    [Fecha_finEjec] datetime NULL,
    [RutEjecutivoFin] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [CodOficina_fin] int NULL,
    [FlagEstado] int NULL,
)