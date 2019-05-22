IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[TabEmp_Fidelizacion]') AND type = 'U')
CREATE TABLE [empresas].[TabEmp_Fidelizacion]
(
    [fide_id] int NOT NULL IDENTITY(1, 1),
    [fide_estamento] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [fide_actividad] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [fide_cobertura] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [fide_fecha_calendario] date NULL,
    [fide_fecha_accion] datetime NULL,
    [representante_id] int NOT NULL,
    [cod_oficina] int NULL,
    [rut_ejecutivo] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabEmp_F__463CFFA5320C68B7] PRIMARY KEY CLUSTERED ([fide_id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[empresas].[FK_DEP_REPEMP]') AND parent_object_id = OBJECT_ID('[empresas].[TabEmp_Fidelizacion]'))
BEGIN
    ALTER TABLE [empresas].[TabEmp_Fidelizacion] WITH CHECK ADD CONSTRAINT [FK_DEP_REPEMP] FOREIGN KEY ([representante_id]) REFERENCES [empresas].[TabEmp_RepresentanteEmpresa] ([rep_id])
    ALTER TABLE [empresas].[TabEmp_Fidelizacion] CHECK CONSTRAINT [FK_DEP_REPEMP]
END