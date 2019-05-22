IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[TabEmp_RepresentanteEmpresa]') AND type = 'U')
CREATE TABLE [empresas].[TabEmp_RepresentanteEmpresa]
(
    [rep_id] int NOT NULL IDENTITY(1, 1),
    [rep_nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [rep_cargo] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [emp_id] int NULL,
    CONSTRAINT [PK__TabEmp_R__DC905AF4414EAC47] PRIMARY KEY CLUSTERED ([rep_id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[empresas].[FK_EMPRESA_REP]') AND parent_object_id = OBJECT_ID('[empresas].[TabEmp_RepresentanteEmpresa]'))
BEGIN
    ALTER TABLE [empresas].[TabEmp_RepresentanteEmpresa] WITH CHECK ADD CONSTRAINT [FK_EMPRESA_REP] FOREIGN KEY ([emp_id]) REFERENCES [empresas].[TabEmp_Empresa] ([emp_id])
    ALTER TABLE [empresas].[TabEmp_RepresentanteEmpresa] CHECK CONSTRAINT [FK_EMPRESA_REP]
END