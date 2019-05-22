IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[TabEmp_GestionRetencion]') AND type = 'U')
CREATE TABLE [empresas].[TabEmp_GestionRetencion]
(
    [gstr_id] int NOT NULL IDENTITY(1, 1),
    [gstr_fecha] datetime NULL,
    [gstr_etapa] varchar(150) COLLATE Modern_Spanish_CI_AS NULL,
    [gstr_observaciones] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
    [gstr_fecha_accion] datetime NOT NULL,
    [retencion_id] int NOT NULL,
    [ejecutivo_rut] varchar(20) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [oficina] int NOT NULL,
    CONSTRAINT [PK__TabEmp_G__9AAD2FC539AD8A7F] PRIMARY KEY CLUSTERED ([gstr_id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[empresas].[FK_DEP_GST_ON_RETENCION]') AND parent_object_id = OBJECT_ID('[empresas].[TabEmp_GestionRetencion]'))
BEGIN
    ALTER TABLE [empresas].[TabEmp_GestionRetencion] WITH CHECK ADD CONSTRAINT [FK_DEP_GST_ON_RETENCION] FOREIGN KEY ([retencion_id]) REFERENCES [empresas].[TabEmp_Retencion] ([ret_id])
    ALTER TABLE [empresas].[TabEmp_GestionRetencion] CHECK CONSTRAINT [FK_DEP_GST_ON_RETENCION]
END