IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_ObservacionAfiliado]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_ObservacionAfiliado]
(
    [RutAfiliado] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [Fecha_Obs] datetime NULL,
    [Observacion] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [RutEjecutivo] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [CodOficina] int NULL,
)