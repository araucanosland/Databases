IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[Oficinas]') AND type = 'U')
CREATE TABLE [mae].[Oficinas]
(
    [PeriodoVigencia] float NULL,
    [Cod_Oficina] float NULL,
    [Oficina] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Cod_OficinaProc] float NULL,
    [OficinaProc] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Cod_Zona] float NULL,
    [Zona] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [cod_Region] int NULL,
    [Region] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [Cod_Comuna] int NULL,
)