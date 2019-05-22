IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[TabFicha_Desarrollo]') AND type = 'U')
CREATE TABLE [fichas].[TabFicha_Desarrollo]
(
    [desa_id] bigint NOT NULL IDENTITY(1, 1),
    [encabezado_id] int NOT NULL,
    [respuesta_id] int NOT NULL,
    [texto] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabFicha__47C8FB506F1576F7] PRIMARY KEY CLUSTERED ([desa_id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[fichas].[FK_ENCABEZADO_FORM]') AND parent_object_id = OBJECT_ID('[fichas].[TabFicha_Desarrollo]'))
BEGIN
    ALTER TABLE [fichas].[TabFicha_Desarrollo] WITH NOCHECK ADD CONSTRAINT [FK_ENCABEZADO_FORM] FOREIGN KEY ([encabezado_id]) REFERENCES [fichas].[TabFicha_Encabezado] ([enc_id])
    ALTER TABLE [fichas].[TabFicha_Desarrollo] CHECK CONSTRAINT [FK_ENCABEZADO_FORM]
END

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[fichas].[FK_DESARROLLO_FORM]') AND parent_object_id = OBJECT_ID('[fichas].[TabFicha_Desarrollo]'))
BEGIN
    ALTER TABLE [fichas].[TabFicha_Desarrollo] WITH NOCHECK ADD CONSTRAINT [FK_DESARROLLO_FORM] FOREIGN KEY ([respuesta_id]) REFERENCES [fichas].[TabFicha_Respuesta] ([resp_id])
    ALTER TABLE [fichas].[TabFicha_Desarrollo] CHECK CONSTRAINT [FK_DESARROLLO_FORM]
END