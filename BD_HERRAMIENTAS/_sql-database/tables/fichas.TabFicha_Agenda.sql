IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[TabFicha_Agenda]') AND type = 'U')
CREATE TABLE [fichas].[TabFicha_Agenda]
(
    [age_id] int NOT NULL IDENTITY(1, 1),
    [encabezado_id] int NOT NULL,
    [fecha] date NULL,
    [estamento] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
    [nombre_funcionario] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [cargo_funcionario] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabFicha__A781B71363A3C44B] PRIMARY KEY CLUSTERED ([age_id] ASC)
)