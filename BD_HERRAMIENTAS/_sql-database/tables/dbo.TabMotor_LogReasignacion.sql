IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_LogReasignacion]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_LogReasignacion]
(
    [logr_id] int NOT NULL IDENTITY(1, 1),
    [logr_fecha_accion] datetime NULL,
    [logr_rut_origen] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [logr_rut_destino] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [logr_origen_antes] int NULL,
    [logr_origen_despues] int NULL,
    [logr_destino_antes] int NULL,
    [logr_destino_despues] int NULL,
    [logr_cantidad_reasignada] int NULL,
    [logr_tipo_campania] int NULL,
    [logr_rut_agente] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabMotor__B889AEFA16CE6296] PRIMARY KEY CLUSTERED ([logr_id] ASC)
)