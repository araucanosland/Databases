IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Preferencia_Afiliado]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Preferencia_Afiliado]
(
    [Afiliado_rut] int NOT NULL,
    [Fecha_accion] datetime NOT NULL,
    [Tipo_preferencia] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Valor_preferencia] varchar(500) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Valida] bit NOT NULL,
)