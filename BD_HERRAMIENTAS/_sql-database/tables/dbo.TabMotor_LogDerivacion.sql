IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_LogDerivacion]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_LogDerivacion]
(
    [deri_id] bigint NOT NULL IDENTITY(1, 1),
    [oficina_derivacion] int NULL,
    [ejecutivo_derivacion] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [fecha_accion] datetime NOT NULL,
    [id_asignacion] bigint NOT NULL,
    CONSTRAINT [PK__TabMotor__65551EAB76EBA2E9] PRIMARY KEY CLUSTERED ([deri_id] ASC)
)