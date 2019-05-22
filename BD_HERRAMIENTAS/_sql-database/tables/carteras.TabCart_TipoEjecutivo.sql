IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_TipoEjecutivo]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_TipoEjecutivo]
(
    [id_TipoCargo] int NOT NULL IDENTITY(1, 1),
    [Nombre_TipoCargo] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabCart___E079D44B324172E1] PRIMARY KEY CLUSTERED ([id_TipoCargo] ASC)
)