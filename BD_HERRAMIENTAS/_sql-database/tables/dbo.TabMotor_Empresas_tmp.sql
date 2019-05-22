IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Empresas_tmp]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Empresas_tmp]
(
    [Empresa_Rut] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Empresa_Dv] varchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [Empresa] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [N_Trabajadores] int NULL,
)