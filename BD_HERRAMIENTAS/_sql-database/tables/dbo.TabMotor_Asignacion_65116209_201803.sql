IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Asignacion_65116209_201803]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Asignacion_65116209_201803]
(
    [id_Asign] int NOT NULL,
    [Periodo] varchar(6) COLLATE Modern_Spanish_CI_AS NULL,
    [Afiliado_Rut] decimal(10, 0) NULL,
    [Afiliado_Dv] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [Nombre] varchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [Apellido] varchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [Empresa_Rut] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Empresa_Dv] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [Empresa] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [ClaRiesgoEmpresa] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [Holding] varchar(25) COLLATE Modern_Spanish_CI_AS NULL,
    [Celular] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [Telefono1] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [Telefono2] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [Email] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [MontoPension] decimal(8, 0) NULL,
    [MontoRenta] int NULL,
    [Monto_preaprobado] int NULL,
    [Antiguedad_en_Meses] int NULL,
    [LicMedicaVigente] int NULL,
    [CreditosVigentes] int NULL,
    [CredVig_Meses_Morosos] int NULL,
    [CredVig_MontoCuota] int NULL,
    [EsPensionado] int NULL,
    [EsPrivado] int NULL,
    [EsPublico] int NULL,
    [Contacto] int NULL,
    [Segmento] varchar(11) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaNacimiento] date NULL,
    [Edad] int NULL,
    [PensionadoFFAA] int NULL,
    [EmpresaEsPensionado] int NULL,
    [EmpresaEsPublico] int NULL,
    [EmpresaEsPrivado] int NULL,
    [RiesgoPerfil] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
    [RiesgoMaxVecesRenta] bigint NULL,
    [RiesgoMaxPreAprobado] bigint NULL,
    [PreAprobadoFinal] bigint NULL,
    [CredVigente] int NULL,
    [Oficina] int NOT NULL,
    [Asignado] int NOT NULL,
    [Ejec_Asignacion] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [TipoAsignacion] int NULL,
    [Prioridad] int NULL,
    [TipoCampania] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
    [Cuadrante] int NULL,
    [OfertaTexto] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [TipoDerivacion] varchar(150) COLLATE Modern_Spanish_CI_AS NULL,
)