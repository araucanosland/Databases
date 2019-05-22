IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_FichaEmpresa]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_FichaEmpresa]
(
    [Id_Ficha] int NOT NULL IDENTITY(1, 1),
    [Fecha_Ingreso] datetime NULL,
    [Empresa_Rut] varchar(10) COLLATE Modern_Spanish_CI_AS NULL,
    [Empresa_Nombre] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [Cod_Sucursal] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [Estamento] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [Nombre_Funcionario_Emple] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [Cargo_Funcionario] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [Num_Empleados] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [funcionario_caja] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_1] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_1_obs] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_2_radio] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_2_combo] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_2_obs2] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_2_radio_1] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_2_obs3] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_2_obs4] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_2_obs5] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_3_radio] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_3_obs] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_4_radio] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_4_radio_2] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_4_obs_1] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_4_obs_2] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_5_radio] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_5_obs_1] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_5_obs_2] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_6_radio] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_6_obs_1] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_6_obs_2] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_7_radio] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_7_obs_1] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_8] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_8_obs_1] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_9_radio] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_9_radio_2] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_9_obs] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_10_radio] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_10_radio_2] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_10_obs] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_11] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_11_obs] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [fecha_reunion] datetime NULL,
    [estamento_2] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [nombre_funcionario_emp_2] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [cargo_funcionario_2] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [EstadoGuardar] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [Trimestre] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [Anexo] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [RutEjec] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [Fono] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [Mail] varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
    [NombreSucursal] varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
    [Direccion] varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabMotor__86C9E8A665C116E7] PRIMARY KEY CLUSTERED ([Id_Ficha] ASC)
)