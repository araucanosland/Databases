IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[TabEmp_GestionProspeccion]') AND type = 'U')
CREATE TABLE [empresas].[TabEmp_GestionProspeccion]
(
    [gstp_id] int NOT NULL IDENTITY(1, 1),
    [gstp_fecha] datetime NULL,
    [gstp_etapa] varchar(150) COLLATE Modern_Spanish_CI_AS NULL,
    [gstp_observaciones] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
    [gstp_fecha_accion] datetime NULL,
    [prospecto_id] int NOT NULL,
    [ejecutivo_rut] varchar(20) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [oficina] int NOT NULL,
    CONSTRAINT [PK__TabEmp_G__896E1C1B35DCF99B] PRIMARY KEY CLUSTERED ([gstp_id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[empresas].[FK_DEP_GST_ON_PROSPECCION]') AND parent_object_id = OBJECT_ID('[empresas].[TabEmp_GestionProspeccion]'))
BEGIN
    ALTER TABLE [empresas].[TabEmp_GestionProspeccion] WITH CHECK ADD CONSTRAINT [FK_DEP_GST_ON_PROSPECCION] FOREIGN KEY ([prospecto_id]) REFERENCES [empresas].[TabEmp_Prospeccion] ([pros_id])
    ALTER TABLE [empresas].[TabEmp_GestionProspeccion] CHECK CONSTRAINT [FK_DEP_GST_ON_PROSPECCION]
END