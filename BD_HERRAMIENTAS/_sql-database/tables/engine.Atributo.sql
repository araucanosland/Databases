IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[Atributo]') AND type = 'U')
CREATE TABLE [engine].[Atributo]
(
    [CodAttr] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [CodCamp] int NOT NULL,
    [Etiqueta] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [TipoDato] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [MostrarEnLista] bit NOT NULL DEFAULT((0)),
    CONSTRAINT [PK__Atributo__B1F431440CBAE877] PRIMARY KEY CLUSTERED 
    (
        [CodAttr] ASC,
        [CodCamp] ASC
    )
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[engine].[Atributo]') AND name = 'BUSQIDX_ADLe')
CREATE NONCLUSTERED INDEX [BUSQIDX_ADLe] ON [engine].[Atributo](
    [CodAttr] ASC,
    [CodCamp] ASC
)