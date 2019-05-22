IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[TabEmp_AmbitosRetencion]') AND type = 'U')
CREATE TABLE [empresas].[TabEmp_AmbitosRetencion]
(
    [aret_id] int NOT NULL IDENTITY(1, 1),
    [ambito_id] int NOT NULL,
    [retencion_id] int NOT NULL,
    CONSTRAINT [PK__TabEmp_A__1DD9C324269AB60B] PRIMARY KEY CLUSTERED ([aret_id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[empresas].[FK_DEP_ON_AMBITOS_AREA]') AND parent_object_id = OBJECT_ID('[empresas].[TabEmp_AmbitosRetencion]'))
BEGIN
    ALTER TABLE [empresas].[TabEmp_AmbitosRetencion] WITH CHECK ADD CONSTRAINT [FK_DEP_ON_AMBITOS_AREA] FOREIGN KEY ([ambito_id]) REFERENCES [empresas].[TabEmp_AmbitosArea] ([ambito_id])
    ALTER TABLE [empresas].[TabEmp_AmbitosRetencion] CHECK CONSTRAINT [FK_DEP_ON_AMBITOS_AREA]
END

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[empresas].[FK_DEP_ON_RETENCION]') AND parent_object_id = OBJECT_ID('[empresas].[TabEmp_AmbitosRetencion]'))
BEGIN
    ALTER TABLE [empresas].[TabEmp_AmbitosRetencion] WITH CHECK ADD CONSTRAINT [FK_DEP_ON_RETENCION] FOREIGN KEY ([retencion_id]) REFERENCES [empresas].[TabEmp_Retencion] ([ret_id])
    ALTER TABLE [empresas].[TabEmp_AmbitosRetencion] CHECK CONSTRAINT [FK_DEP_ON_RETENCION]
END