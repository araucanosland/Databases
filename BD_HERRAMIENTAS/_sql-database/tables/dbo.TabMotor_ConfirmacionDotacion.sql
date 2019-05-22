IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_ConfirmacionDotacion]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_ConfirmacionDotacion]
(
    [EjecutivoRut] varchar(20) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Fecha] datetime NOT NULL,
    [CodOficina] int NULL,
)