IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Notificacion_Asignacion]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Notificacion_Asignacion]
(
    [AfiliadoRut] varchar(20) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Tipo] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Valor] varchar(200) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Cantidad] int NULL,
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Notificacion_Asignacion]') AND name = 'IDX_BUSQUEDA_NTF')
CREATE NONCLUSTERED INDEX [IDX_BUSQUEDA_NTF] ON [dbo].[TabMotor_Notificacion_Asignacion](
    [AfiliadoRut] ASC,
    [Tipo] ASC
)