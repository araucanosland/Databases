IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[alertafi].[TabMotor_AfiAlertas]') AND type = 'U')
CREATE TABLE [alertafi].[TabMotor_AfiAlertas]
(
    [Actualizacion] varchar(8) COLLATE Modern_Spanish_CI_AS NULL,
    [AfiliadoRut] numeric NULL,
    [AfiRutDv] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [valor] numeric NULL,
    [Tipo] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
)