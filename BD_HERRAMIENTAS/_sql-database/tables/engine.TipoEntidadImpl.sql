IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[TipoEntidadImpl]') AND type = 'U')
CREATE TABLE [engine].[TipoEntidadImpl]
(
    [CodTipoEntidad] int NOT NULL,
    [RutEntidad] int NOT NULL,
    [RutPersonalidadJuridica] int NULL,
    CONSTRAINT [PK__TipoEnti__9A3735591BFD2C07] PRIMARY KEY CLUSTERED 
    (
        [CodTipoEntidad] ASC,
        [RutEntidad] ASC
    )
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[engine].[FK_ENTIDADIMPLEMENTA]') AND parent_object_id = OBJECT_ID('[engine].[TipoEntidadImpl]'))
BEGIN
    ALTER TABLE [engine].[TipoEntidadImpl] WITH CHECK ADD CONSTRAINT [FK_ENTIDADIMPLEMENTA] FOREIGN KEY ([RutEntidad]) REFERENCES [engine].[Entidad] ([RutEntidad])
    ALTER TABLE [engine].[TipoEntidadImpl] CHECK CONSTRAINT [FK_ENTIDADIMPLEMENTA]
END

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[engine].[FK_TIPOENTIDADIMPLEMENTA]') AND parent_object_id = OBJECT_ID('[engine].[TipoEntidadImpl]'))
BEGIN
    ALTER TABLE [engine].[TipoEntidadImpl] WITH CHECK ADD CONSTRAINT [FK_TIPOENTIDADIMPLEMENTA] FOREIGN KEY ([CodTipoEntidad]) REFERENCES [engine].[TipoEndidad] ([CodTipoEntidad])
    ALTER TABLE [engine].[TipoEntidadImpl] CHECK CONSTRAINT [FK_TIPOENTIDADIMPLEMENTA]
END