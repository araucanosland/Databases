IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[proceso].[Afiliado_Falabella_Gestion]') AND type = 'U')
CREATE TABLE [proceso].[Afiliado_Falabella_Gestion]
(
    [TicketGestion] varchar(70) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [RutAfiliado] varchar(20) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [TipoGestion] varchar(150) COLLATE Modern_Spanish_CI_AS NULL,
    [Observacion] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [MontoRef] varchar(30) COLLATE Modern_Spanish_CI_AS NULL,
    [Beneficios] varchar(150) COLLATE Modern_Spanish_CI_AS NULL,
    [Ejecutivo] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [Oficina] varchar(10) COLLATE Modern_Spanish_CI_AS NULL,
    [Telefono] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [Correo] varchar(150) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__Afiliado__2694ABA5284DF453] PRIMARY KEY CLUSTERED 
    (
        [TicketGestion] ASC,
        [RutAfiliado] ASC
    )
)