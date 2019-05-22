IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[Medicamento]') AND type = 'U')
CREATE TABLE [dbo].[Medicamento]
(
    [Medicamento] nvarchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [Categoria] nvarchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [Id] int NOT NULL IDENTITY(1, 1),
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[Medicamento]') AND name = 'IdX_NombreMedicamento')
CREATE UNIQUE NONCLUSTERED INDEX [IdX_NombreMedicamento] ON [dbo].[Medicamento]([Medicamento] ASC)