IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[Contacto]') AND type = 'U')
CREATE TABLE [engine].[Contacto]
(
    [CodTipoEntidad] int NOT NULL,
    [RutEntidad] int NOT NULL,
    [CodCategoria] int NOT NULL,
    [CodTipo] int NOT NULL,
    [ValorContacto] varchar(200) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [CodContacto] bigint NOT NULL IDENTITY(1, 1),
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[engine].[FK_CATEGOARIACONTACTA]') AND parent_object_id = OBJECT_ID('[engine].[Contacto]'))
BEGIN
    ALTER TABLE [engine].[Contacto] WITH CHECK ADD CONSTRAINT [FK_CATEGOARIACONTACTA] FOREIGN KEY ([CodCategoria]) REFERENCES [engine].[CategoriaContacto] ([CodCategoria])
    ALTER TABLE [engine].[Contacto] CHECK CONSTRAINT [FK_CATEGOARIACONTACTA]
END

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[engine].[FK_TIPOCONTACTA]') AND parent_object_id = OBJECT_ID('[engine].[Contacto]'))
BEGIN
    ALTER TABLE [engine].[Contacto] WITH CHECK ADD CONSTRAINT [FK_TIPOCONTACTA] FOREIGN KEY ([CodTipo]) REFERENCES [engine].[TipoContacto] ([CodTipo])
    ALTER TABLE [engine].[Contacto] CHECK CONSTRAINT [FK_TIPOCONTACTA]
END

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[engine].[FK_IMPLCONTACTA]') AND parent_object_id = OBJECT_ID('[engine].[Contacto]'))
BEGIN
    ALTER TABLE [engine].[Contacto] WITH CHECK ADD CONSTRAINT [FK_IMPLCONTACTA] FOREIGN KEY ([CodTipoEntidad]) REFERENCES [engine].[TipoEntidadImpl] ([CodTipoEntidad])
    ALTER TABLE [engine].[Contacto] CHECK CONSTRAINT [FK_IMPLCONTACTA]
END

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[engine].[FK_IMPLCONTACTA]') AND parent_object_id = OBJECT_ID('[engine].[Contacto]'))
BEGIN
    ALTER TABLE [engine].[Contacto] WITH CHECK ADD CONSTRAINT [FK_IMPLCONTACTA] FOREIGN KEY ([RutEntidad]) REFERENCES [engine].[TipoEntidadImpl] ([RutEntidad])
    ALTER TABLE [engine].[Contacto] CHECK CONSTRAINT [FK_IMPLCONTACTA]
END