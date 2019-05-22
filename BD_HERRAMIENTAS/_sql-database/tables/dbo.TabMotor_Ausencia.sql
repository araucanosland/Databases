IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Ausencia]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Ausencia]
(
    [aus_id] int NOT NULL IDENTITY(1, 1),
    [ejec_rut] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [aus_fecha_inicio] datetime NOT NULL,
    [aus_fecha_fin] datetime NOT NULL,
    [tipo_ausencia_id] int NOT NULL,
    [aus_cantidad_dias] int NOT NULL DEFAULT((0)),
    [aus_comentarios] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
    [aus_marca_ausencia] bit NULL DEFAULT((0)),
    CONSTRAINT [PK__TabMotor__122710063552E9B6] PRIMARY KEY CLUSTERED ([aus_id] ASC)
)