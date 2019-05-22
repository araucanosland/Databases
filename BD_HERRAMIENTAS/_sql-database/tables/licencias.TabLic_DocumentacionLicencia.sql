IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[TabLic_DocumentacionLicencia]') AND type = 'U')
CREATE TABLE [licencias].[TabLic_DocumentacionLicencia]
(
    [CodIngresoLM] bigint NULL,
    [PeriodoDocumento] int NOT NULL,
    [CodTipoDoc] int NOT NULL,
    [Recepcionado] bit NOT NULL,
    [CodDocumento] bigint NOT NULL IDENTITY(1, 1),
    CONSTRAINT [PK__TabLic_D__3A2924200504B816] PRIMARY KEY CLUSTERED ([CodDocumento] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[licencias].[FK_INGLM]') AND parent_object_id = OBJECT_ID('[licencias].[TabLic_DocumentacionLicencia]'))
BEGIN
    ALTER TABLE [licencias].[TabLic_DocumentacionLicencia] WITH CHECK ADD CONSTRAINT [FK_INGLM] FOREIGN KEY ([CodIngresoLM]) REFERENCES [licencias].[TabLic_IngresoLicencia] ([CodIngreso])
    ALTER TABLE [licencias].[TabLic_DocumentacionLicencia] CHECK CONSTRAINT [FK_INGLM]
END

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[licencias].[FK_CDTPDC]') AND parent_object_id = OBJECT_ID('[licencias].[TabLic_DocumentacionLicencia]'))
BEGIN
    ALTER TABLE [licencias].[TabLic_DocumentacionLicencia] WITH CHECK ADD CONSTRAINT [FK_CDTPDC] FOREIGN KEY ([CodTipoDoc]) REFERENCES [licencias].[TabLic_TipoDocumento] ([CodTipoDoc])
    ALTER TABLE [licencias].[TabLic_DocumentacionLicencia] CHECK CONSTRAINT [FK_CDTPDC]
END