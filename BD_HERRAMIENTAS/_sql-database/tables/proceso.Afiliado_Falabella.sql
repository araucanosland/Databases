IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[proceso].[Afiliado_Falabella]') AND type = 'U')
CREATE TABLE [proceso].[Afiliado_Falabella]
(
    [RutAfiliado] varchar(20) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Nombres] varchar(150) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__Afiliado__54D79CD5247D636F] PRIMARY KEY CLUSTERED ([RutAfiliado] ASC)
)