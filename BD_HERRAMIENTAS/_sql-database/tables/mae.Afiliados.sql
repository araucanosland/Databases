IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[Afiliados]') AND type = 'U')
CREATE TABLE [mae].[Afiliados]
(
    [Periodo] int NULL,
    [FechaCorte] varchar(8000) COLLATE Modern_Spanish_CI_AS NULL,
    [RutAfiliado] int NULL,
    [DvAfiliado] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [Nombres] varchar(81) COLLATE Modern_Spanish_CI_AS NULL,
    [Apellidos] varchar(81) COLLATE Modern_Spanish_CI_AS NULL,
    [Nacionalidad] varchar(3) COLLATE Modern_Spanish_CI_AS NULL,
    [Sexo] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaNacimiento] date NULL,
    [EstadoCivil] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [RolSegmentoAfiliado] varchar(25) COLLATE Modern_Spanish_CI_AS NULL,
    [InicioValidezRol] date NULL,
    [FinValidezRol] date NULL,
    [RegimenPrevisional] varchar(60) COLLATE Modern_Spanish_CI_AS NULL,
    [RegimenSalud] varchar(40) COLLATE Modern_Spanish_CI_AS NULL,
    [CargoAfiliado] varchar(70) COLLATE Modern_Spanish_CI_AS NULL,
    [TipoContrato] varchar(30) COLLATE Modern_Spanish_CI_AS NULL,
    [PeriodoUltimaRenta] int NULL,
    [RentaUltimaInformada] int NULL,
    [RegionAfiliado] varchar(20) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [ComunaAfiliado] varchar(40) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [IdEmpresa] varchar(10) COLLATE Modern_Spanish_CI_AS NULL,
    [RegionEmpresa] varchar(20) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [ComunaEmpresa] varchar(40) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [rutempresa] numeric NULL,
    [dvempresa] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [nombreempresa] varchar(45) COLLATE Modern_Spanish_CI_AS NULL,
    [idformajuridica] numeric NULL,
    [Vigente] int NULL,
    [Fallecido] int NULL,
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[mae].[Afiliados]') AND name = 'Idx_rutAfi')
CREATE NONCLUSTERED INDEX [Idx_rutAfi] ON [mae].[Afiliados]([RutAfiliado] ASC)