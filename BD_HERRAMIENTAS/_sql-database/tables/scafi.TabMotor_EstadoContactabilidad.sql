IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[scafi].[TabMotor_EstadoContactabilidad]') AND type = 'U')
CREATE TABLE [scafi].[TabMotor_EstadoContactabilidad]
(
    [IdEstado] int NULL,
    [IdEstadoPadre] int NULL,
    [Descripcion] varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
    [IndiceContac] int NULL,
)