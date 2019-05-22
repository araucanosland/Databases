IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Asignacion_Rechazos]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Asignacion_Rechazos]
(
    [Afiliado_Rut] numeric NULL,
    [Empresa_Rut] numeric NULL,
    [MotivoRechazo] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Periodo] varchar(6) COLLATE Modern_Spanish_CI_AS NULL,
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Asignacion_Rechazos]') AND name = 'Idx')
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[TabMotor_Asignacion_Rechazos](
    [Afiliado_Rut] ASC,
    [Empresa_Rut] ASC,
    [Periodo] ASC
)