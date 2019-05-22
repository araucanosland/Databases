IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Noticia]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Noticia]
(
    [noti_id] int NOT NULL,
    [noti_titulo] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [noti_cuerpo] varchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [noti_cerrable] int NULL,
    [noti_fecha] datetime NULL,
    CONSTRAINT [PK__TabMotor__FDA4F30A1E6F845E] PRIMARY KEY CLUSTERED ([noti_id] ASC)
)