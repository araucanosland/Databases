IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[TabSca_Rol]') AND type = 'U')
CREATE TABLE [security].[TabSca_Rol]
(
    [CodRol] int NOT NULL IDENTITY(1, 1),
    [Nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabSca_R__848731A152442E1F] PRIMARY KEY CLUSTERED ([CodRol] ASC)
)