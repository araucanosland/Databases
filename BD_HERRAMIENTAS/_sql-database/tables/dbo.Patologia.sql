IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[Patologia]') AND type = 'U')
CREATE TABLE [dbo].[Patologia]
(
    [Patologia] nvarchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [Categoria] nvarchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [Id] int NOT NULL IDENTITY(1, 1),
)