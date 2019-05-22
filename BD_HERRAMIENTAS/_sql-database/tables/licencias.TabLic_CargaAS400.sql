IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[TabLic_CargaAS400]') AND type = 'U')
CREATE TABLE [licencias].[TabLic_CargaAS400]
(
    [Periodo] varchar(6) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaIngreso] numeric NOT NULL,
    [Oficina] numeric NOT NULL,
    [Afiliado_Rut] varchar(32) COLLATE Modern_Spanish_CI_AS NULL,
    [Licencia_folio] numeric NULL,
    [FechaInicio] numeric NOT NULL,
    [Folio_operador] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [folio_folio] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [Folio_DV] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [Folio_Completo] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [Tipo] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [Folio_Compara] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[licencias].[TabLic_CargaAS400]') AND name = 'idxFolio')
CREATE NONCLUSTERED INDEX [idxFolio] ON [licencias].[TabLic_CargaAS400]([Folio_Compara] ASC)