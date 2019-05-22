IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[TabFicha_NubeRespuestas]') AND type = 'U')
CREATE TABLE [fichas].[TabFicha_NubeRespuestas]
(
    [nresp_id] int NOT NULL IDENTITY(1, 1),
    [despriccion] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [valor] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [tag] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabFicha__2564661F76B698BF] PRIMARY KEY CLUSTERED ([nresp_id] ASC)
)