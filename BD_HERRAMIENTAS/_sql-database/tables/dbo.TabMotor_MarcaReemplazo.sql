IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_MarcaReemplazo]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_MarcaReemplazo]
(
    [Id] int NOT NULL IDENTITY(1, 1),
    [EjecutivoRut] varchar(20) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [AusenciaId] int NULL,
    [MarcaForzada] bit NOT NULL DEFAULT((0)),
    [FechaMarca] datetime NOT NULL,
    CONSTRAINT [PK__TabMotor__3214EC077CA47C3F] PRIMARY KEY CLUSTERED ([Id] ASC)
)