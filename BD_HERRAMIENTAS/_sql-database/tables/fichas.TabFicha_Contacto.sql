IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[TabFicha_Contacto]') AND type = 'U')
CREATE TABLE [fichas].[TabFicha_Contacto]
(
    [cnt_id] int NOT NULL IDENTITY(1, 1),
    [encabezado_id] int NOT NULL,
    [nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [telefono] int NULL,
    [email] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [direccion] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [compromisos] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [tipo] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabFicha__CDB1F3C16774552F] PRIMARY KEY CLUSTERED ([cnt_id] ASC)
)