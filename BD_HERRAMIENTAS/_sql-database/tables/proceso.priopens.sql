IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[proceso].[priopens]') AND type = 'U')
CREATE TABLE [proceso].[priopens]
(
    [rut_Afiliado] float NULL,
    [Id_deudor] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Prioridad] float NULL,
)