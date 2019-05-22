IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMae_Comuna]') AND type = 'U')
CREATE TABLE [dbo].[TabMae_Comuna]
(
    [COMUNA_CODIGO] numeric NULL,
    [COMUNA_NOMBRESIAGF] varchar(40) COLLATE Modern_Spanish_CI_AS NULL,
    [COMUNA_CODIGONN] numeric NULL,
    [REGION_CODIGOSIAGF] numeric NULL,
    [REGION_NOMBRE] varchar(40) COLLATE Modern_Spanish_CI_AS NULL,
    [PROVINCIA_CODIGOSIAGF] numeric NULL,
    [REGION_NOMBRESIAGF] varchar(40) COLLATE Modern_Spanish_CI_AS NULL,
)