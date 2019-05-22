IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_TipoAusencia]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_TipoAusencia]
(
    [taus_id] int NOT NULL IDENTITY(1, 1),
    [taus_nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [taus_clase_color] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [taus_es_rango_fechas] bit NULL,
    [taus_es_dias_corridos] bit NULL,
    CONSTRAINT [PK__TabMotor__B1BDAF8D318258D2] PRIMARY KEY CLUSTERED ([taus_id] ASC)
)