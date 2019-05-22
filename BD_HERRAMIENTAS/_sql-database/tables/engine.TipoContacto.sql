IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[TipoContacto]') AND type = 'U')
CREATE TABLE [engine].[TipoContacto]
(
    [CodTipo] int NOT NULL IDENTITY(1, 1),
    [NombreTipo] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TipoCont__752B12C0108B795B] PRIMARY KEY CLUSTERED ([CodTipo] ASC)
)