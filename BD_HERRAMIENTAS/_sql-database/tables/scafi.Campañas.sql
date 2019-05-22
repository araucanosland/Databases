IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[scafi].[Campañas]') AND type = 'U')
CREATE TABLE [scafi].[Campañas]
(
    [Periodo] varchar(30) COLLATE Modern_Spanish_CI_AS NULL,
    [Afiliado_Rut] decimal(10, 0) NULL,
    [Afiliado_Dv] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [Campania] varchar(21) COLLATE Modern_Spanish_CI_AS NULL,
    [Oferta] bigint NULL,
    [Prioridad] int NULL,
    [id_Asign] bigint NOT NULL,
    [Tipo] varchar(6) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [TipoAsignacion] int NULL,
)