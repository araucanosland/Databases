IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Dotacion_Total]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Dotacion_Total]
(
    [Periodo] varchar(6) COLLATE Modern_Spanish_CI_AS NULL,
    [Rut] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Apellido y nombres] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Cod_Sucursal] float NULL,
    [Sucursal] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Descripción ampliada] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Tipo de Funcionario] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Código Cargo genérico] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Fecha de Ingreso] datetime NULL,
    [Correo] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Telefono ] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Anexo] float NULL,
    [TipoAusencia] varchar(10) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [FechaIni] varchar(30) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [FechaFin] varchar(30) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [DiasHabiles] int NULL,
    [DiasAusentes] int NULL,
    [DiasLaborables] int NOT NULL,
    [NReg_Asignacion] int NOT NULL,
)