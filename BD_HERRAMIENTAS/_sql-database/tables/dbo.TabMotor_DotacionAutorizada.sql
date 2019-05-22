IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_DotacionAutorizada]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_DotacionAutorizada]
(
    [Oficina] float NULL,
    [Cargo] nvarchar(250) COLLATE Modern_Spanish_CI_AS NULL,
    [Titular] nvarchar(100) COLLATE Modern_Spanish_CI_AS NULL,
    [Reemplazo] nvarchar(100) COLLATE Modern_Spanish_CI_AS NULL,
    [Obs] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
)