IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[TabEmp_Prospeccion]') AND type = 'U')
CREATE TABLE [empresas].[TabEmp_Prospeccion]
(
    [pros_id] int NOT NULL IDENTITY(1, 1),
    [empresa_id] int NOT NULL,
    [pros_dotacion] int NULL,
    [pros_caja_origen] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [ejecutivo_rut] varchar(20) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [oficina] int NOT NULL,
    CONSTRAINT [PK__TabEmp_P__387FCABB3D7E1B63] PRIMARY KEY CLUSTERED ([pros_id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[empresas].[FK_DEP_PROS_ON_EMPRESA]') AND parent_object_id = OBJECT_ID('[empresas].[TabEmp_Prospeccion]'))
BEGIN
    ALTER TABLE [empresas].[TabEmp_Prospeccion] WITH CHECK ADD CONSTRAINT [FK_DEP_PROS_ON_EMPRESA] FOREIGN KEY ([empresa_id]) REFERENCES [empresas].[TabEmp_Empresa] ([emp_id])
    ALTER TABLE [empresas].[TabEmp_Prospeccion] CHECK CONSTRAINT [FK_DEP_PROS_ON_EMPRESA]
END