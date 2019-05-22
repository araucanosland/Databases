IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Dotacion_BAK201811]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Dotacion_BAK201811]
(
    [Periodo] varchar(6) COLLATE Modern_Spanish_CI_AS NULL,
    [Rut] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Ejec_Rut] numeric NULL,
    [Ejec_Dv] nvarchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [Nombre] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Cod_Sucursal] float NULL,
    [Sucursal] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Cargo] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Correo] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Telefono] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Anexo] float NULL,
    [TipoAusencia] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Ausencia_FechaIni] varchar(30) COLLATE Modern_Spanish_CI_AS NULL,
    [Ausencia_FechaFin] varchar(30) COLLATE Modern_Spanish_CI_AS NULL,
    [HabilesMes] int NULL,
    [DiasAusentes] int NULL,
    [DiasLaborables] int NULL,
    [NReg_Asignacion] int NULL,
    [TipoAsignacion] int NULL,
    [AsignacionObs] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [EsAsignable] int NULL,
    [Canal] varchar(25) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaIngreso] date NULL,
    [FechaFinalizacion] date NULL,
    [TipoContrato] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [CargoOriginal] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Sexo] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
)