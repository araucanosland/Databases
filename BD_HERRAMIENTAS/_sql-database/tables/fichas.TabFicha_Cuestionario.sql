IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[TabFicha_Cuestionario]') AND type = 'U')
CREATE TABLE [fichas].[TabFicha_Cuestionario]
(
    [cuest_id] int NOT NULL IDENTITY(1, 1),
    [descripcion] varchar(500) COLLATE Modern_Spanish_CI_AS NOT NULL,
    CONSTRAINT [PK__TabFicha__701D0D216B44E613] PRIMARY KEY CLUSTERED ([cuest_id] ASC)
)