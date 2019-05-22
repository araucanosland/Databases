IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Licencia_Recepcion]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Licencia_Recepcion]
(
    [RutEmpresa] varchar(20) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [FechaRecepcionLicencia] date NOT NULL,
    [Num_LMRecibida] int NULL,
    [Num_LMDigitada] int NULL,
    [Num_LMNoDigitada] int NULL,
    [Num_LMNoRecepcion] int NULL,
    [RutEjec] varchar(20) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [CodOficinaEjec] int NOT NULL,
    [FechaActualizacion] datetime NULL,
    [Num_LMRecepcionada] int NULL,
    CONSTRAINT [PK__TabMotor__CF8D416A6F4A8121] PRIMARY KEY CLUSTERED 
    (
        [RutEmpresa] ASC,
        [FechaRecepcionLicencia] ASC,
        [RutEjec] ASC,
        [CodOficinaEjec] ASC
    )
)