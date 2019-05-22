IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_PeriodoAsignacionDotacion]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_PeriodoAsignacionDotacion]
(
    [Periodo] int NOT NULL,
    [FechaInicio] datetime NOT NULL,
    [FechaFin] datetime NOT NULL,
    [PeriodoAbierto] int NOT NULL,
)