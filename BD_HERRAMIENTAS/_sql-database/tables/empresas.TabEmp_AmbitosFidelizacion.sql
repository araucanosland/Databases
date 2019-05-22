IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[TabEmp_AmbitosFidelizacion]') AND type = 'U')
CREATE TABLE [empresas].[TabEmp_AmbitosFidelizacion]
(
    [afid_id] int NOT NULL IDENTITY(1, 1),
    [ambito_id] int NOT NULL,
    [fidelizacion_id] int NOT NULL,
    CONSTRAINT [PK__TabEmp_A__5165389D22CA2527] PRIMARY KEY CLUSTERED ([afid_id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[empresas].[FK_DEP_AMBAR]') AND parent_object_id = OBJECT_ID('[empresas].[TabEmp_AmbitosFidelizacion]'))
BEGIN
    ALTER TABLE [empresas].[TabEmp_AmbitosFidelizacion] WITH CHECK ADD CONSTRAINT [FK_DEP_AMBAR] FOREIGN KEY ([ambito_id]) REFERENCES [empresas].[TabEmp_AmbitosArea] ([ambito_id])
    ALTER TABLE [empresas].[TabEmp_AmbitosFidelizacion] CHECK CONSTRAINT [FK_DEP_AMBAR]
END

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[empresas].[FK_DEP_FIDEL]') AND parent_object_id = OBJECT_ID('[empresas].[TabEmp_AmbitosFidelizacion]'))
BEGIN
    ALTER TABLE [empresas].[TabEmp_AmbitosFidelizacion] WITH CHECK ADD CONSTRAINT [FK_DEP_FIDEL] FOREIGN KEY ([fidelizacion_id]) REFERENCES [empresas].[TabEmp_Fidelizacion] ([fide_id])
    ALTER TABLE [empresas].[TabEmp_AmbitosFidelizacion] CHECK CONSTRAINT [FK_DEP_FIDEL]
END