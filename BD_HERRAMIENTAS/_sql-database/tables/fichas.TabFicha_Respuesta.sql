IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[TabFicha_Respuesta]') AND type = 'U')
CREATE TABLE [fichas].[TabFicha_Respuesta]
(
    [resp_id] int NOT NULL IDENTITY(1, 1),
    [nuberespuesta_id] int NULL,
    [pregunta_id] int NULL,
    CONSTRAINT [PK__TabFicha__F9F4FD9A7E57BA87] PRIMARY KEY CLUSTERED ([resp_id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[fichas].[FK_NUBE_OPCIONES]') AND parent_object_id = OBJECT_ID('[fichas].[TabFicha_Respuesta]'))
BEGIN
    ALTER TABLE [fichas].[TabFicha_Respuesta] WITH CHECK ADD CONSTRAINT [FK_NUBE_OPCIONES] FOREIGN KEY ([nuberespuesta_id]) REFERENCES [fichas].[TabFicha_NubeRespuestas] ([nresp_id])
    ALTER TABLE [fichas].[TabFicha_Respuesta] CHECK CONSTRAINT [FK_NUBE_OPCIONES]
END

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[fichas].[FK_PREG_OPCION]') AND parent_object_id = OBJECT_ID('[fichas].[TabFicha_Respuesta]'))
BEGIN
    ALTER TABLE [fichas].[TabFicha_Respuesta] WITH CHECK ADD CONSTRAINT [FK_PREG_OPCION] FOREIGN KEY ([pregunta_id]) REFERENCES [fichas].[TabFicha_Pregunta] ([preg_id])
    ALTER TABLE [fichas].[TabFicha_Respuesta] CHECK CONSTRAINT [FK_PREG_OPCION]
END