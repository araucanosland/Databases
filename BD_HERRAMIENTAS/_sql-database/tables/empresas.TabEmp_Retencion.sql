IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[TabEmp_Retencion]') AND type = 'U')
CREATE TABLE [empresas].[TabEmp_Retencion]
(
    [ret_id] int NOT NULL IDENTITY(1, 1),
    [empresa_id] int NOT NULL,
    [ret_estamento] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [ret_segmento] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
    [ret_dotacion] int NULL,
    [ret_caja_destino] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [ejecutivo_rut] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [oficina] int NULL,
    CONSTRAINT [PK__TabEmp_R__E9F34A4048EFCE0F] PRIMARY KEY CLUSTERED ([ret_id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[empresas].[FK_DEP_ON_EMPRESA]') AND parent_object_id = OBJECT_ID('[empresas].[TabEmp_Retencion]'))
BEGIN
    ALTER TABLE [empresas].[TabEmp_Retencion] WITH CHECK ADD CONSTRAINT [FK_DEP_ON_EMPRESA] FOREIGN KEY ([empresa_id]) REFERENCES [empresas].[TabEmp_Empresa] ([emp_id])
    ALTER TABLE [empresas].[TabEmp_Retencion] CHECK CONSTRAINT [FK_DEP_ON_EMPRESA]
END