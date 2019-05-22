IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Licencia_Envio_Compin]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Licencia_Envio_Compin]
(
    [FechaEnvioLicencia] datetime NULL,
    [RutEjec] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [CodOficinaEjec] int NULL,
    [FechaActualizacion] datetime NULL,
    [Num_LM_Envio] int NULL,
)