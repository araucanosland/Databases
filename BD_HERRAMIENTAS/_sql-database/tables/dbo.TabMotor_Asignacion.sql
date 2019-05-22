IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Asignacion]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Asignacion]
(
    [id_Asign] int NOT NULL,
    [Periodo] varchar(6) COLLATE Modern_Spanish_CI_AS NULL,
    [Afiliado_Rut] decimal(10, 0) NULL,
    [Afiliado_Dv] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [Nombre] varchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [Apellido] varchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [Empresa_Rut] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Empresa_Dv] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [Empresa] varchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [ClaRiesgoEmpresa] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Holding] varchar(max) COLLATE Modern_Spanish_CI_AS NULL,
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
    [Ejec_Asignacion] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
    [TipoAsignacion] int NULL,
    [Prioridad] int NULL,
    [TipoCampania] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
    [Cuadrante] int NULL,
    [OfertaTexto] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [TipoDerivacion] varchar(150) COLLATE Modern_Spanish_CI_AS NULL DEFAULT(''),
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Asignacion]') AND name = 'Idx')
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[TabMotor_Asignacion](
    [Periodo] ASC,
    [TipoAsignacion] ASC
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Asignacion]') AND name = 'IDX_BUSQUEDA1')
CREATE NONCLUSTERED INDEX [IDX_BUSQUEDA1] ON [dbo].[TabMotor_Asignacion](
    [Ejec_Asignacion] ASC,
    [TipoAsignacion] ASC
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Asignacion]') AND name = 'idx_guardaGestion')
CREATE NONCLUSTERED INDEX [idx_guardaGestion] ON [dbo].[TabMotor_Asignacion](
    [id_Asign] ASC,
    [TipoDerivacion] ASC,
    [TipoAsignacion] ASC
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Asignacion]') AND name = 'idx_listado')
CREATE NONCLUSTERED INDEX [idx_listado] ON [dbo].[TabMotor_Asignacion](
    [Periodo] ASC,
    [Ejec_Asignacion] ASC
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Asignacion]') AND name = 'idx_ListarByEjecutivo2')
CREATE NONCLUSTERED INDEX [idx_ListarByEjecutivo2] ON [dbo].[TabMotor_Asignacion](
    [Periodo] ASC,
    [TipoAsignacion] ASC,
    [Ejec_Asignacion] ASC,
    [id_Asign] ASC
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Asignacion]') AND name = 'idx_ListarByOficina2')
CREATE NONCLUSTERED INDEX [idx_ListarByOficina2] ON [dbo].[TabMotor_Asignacion](
    [Periodo] ASC,
    [Oficina] ASC,
    [TipoDerivacion] ASC
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Asignacion]') AND name = 'idx_ObtenerByAfiliado')
CREATE NONCLUSTERED INDEX [idx_ObtenerByAfiliado] ON [dbo].[TabMotor_Asignacion]([Periodo] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Asignacion]') AND name = 'idx_periodo')
CREATE NONCLUSTERED INDEX [idx_periodo] ON [dbo].[TabMotor_Asignacion]([Periodo] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Asignacion]') AND name = 'idx_tipoasiig')
CREATE NONCLUSTERED INDEX [idx_tipoasiig] ON [dbo].[TabMotor_Asignacion]([TipoAsignacion] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Asignacion]') AND name = 'IDX_UNICO')
CREATE UNIQUE NONCLUSTERED INDEX [IDX_UNICO] ON [dbo].[TabMotor_Asignacion]([id_Asign] ASC)