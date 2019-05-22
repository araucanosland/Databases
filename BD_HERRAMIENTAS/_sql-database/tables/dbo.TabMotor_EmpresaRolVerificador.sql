IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_EmpresaRolVerificador]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_EmpresaRolVerificador]
(
    [IdAnexo] varchar(10) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [RutEmpresa] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [NombreEmpresa] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
    CONSTRAINT [PK__TabMotor__8C1FE271567ED357] PRIMARY KEY CLUSTERED ([IdAnexo] ASC)
)