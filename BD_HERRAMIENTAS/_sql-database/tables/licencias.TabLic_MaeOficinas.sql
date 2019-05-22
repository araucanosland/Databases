IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[TabLic_MaeOficinas]') AND type = 'U')
CREATE TABLE [licencias].[TabLic_MaeOficinas]
(
    [Cod_Oficina] float NULL,
    [Oficina] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [CodOficinaCompin] int NOT NULL,
    [OficinaCompin] varchar(12) COLLATE Modern_Spanish_CI_AS NOT NULL,
)