IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[TabFicha_Pregunta]') AND type = 'U')
CREATE TABLE [fichas].[TabFicha_Pregunta]
(
    [preg_id] int NOT NULL IDENTITY(1, 1),
    [cuestionario_id] int NOT NULL,
    [titulo] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [item] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [pregunta_relacionada] int NULL,
    CONSTRAINT [PK__TabFicha__C18ECFC67A8729A3] PRIMARY KEY CLUSTERED ([preg_id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[fichas].[FK_QUESTIONARIO_PREGUNTA]') AND parent_object_id = OBJECT_ID('[fichas].[TabFicha_Pregunta]'))
BEGIN
    ALTER TABLE [fichas].[TabFicha_Pregunta] WITH CHECK ADD CONSTRAINT [FK_QUESTIONARIO_PREGUNTA] FOREIGN KEY ([cuestionario_id]) REFERENCES [fichas].[TabFicha_Cuestionario] ([cuest_id])
    ALTER TABLE [fichas].[TabFicha_Pregunta] CHECK CONSTRAINT [FK_QUESTIONARIO_PREGUNTA]
END