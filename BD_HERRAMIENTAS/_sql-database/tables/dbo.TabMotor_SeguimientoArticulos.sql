IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_SeguimientoArticulos]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_SeguimientoArticulos]
(
    [IdSeguimiento] int NOT NULL IDENTITY(1, 1),
    [Nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Oficina] int NULL,
    [FechaRegistro] datetime NULL,
    [EstadoArticulo] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [Comentarios] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabMotor__5643F60F69C6B1F5] PRIMARY KEY CLUSTERED ([IdSeguimiento] ASC)
)