IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[Ofertas]') AND type = 'U')
CREATE TABLE [mae].[Ofertas]
(
    [RUT_SOLICITA] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [NUM_OFERTA] bigint NULL,
    [FECHA_CREA_OFERTA] date NULL,
    [HORA_CREA_OFERTA] varchar(8) COLLATE Modern_Spanish_CI_AS NULL,
    [FECHA_EST_OFERTA] date NULL,
    [HORA_EST_OFERTA] varchar(8) COLLATE Modern_Spanish_CI_AS NULL,
    [ID_EstadoOferta] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [NOMBRE_ESTADOOFERTA] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [IDUSUARIO_OPERA] varchar(25) COLLATE Modern_Spanish_CI_AS NULL,
    [rnk] bigint NULL,
)