IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_EmpresasVigente]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_EmpresasVigente]
(
    [Periodo] varchar(6) COLLATE Modern_Spanish_CI_AS NULL,
    [Empresa_Rut] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Empresa_Dv] varchar(1) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Rut_Dv] varchar(32) COLLATE Modern_Spanish_CI_AS NULL,
    [EmpresaNombre] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_EmpresasVigente]') AND name = 'IDX_BUSQPER')
CREATE NONCLUSTERED INDEX [IDX_BUSQPER] ON [dbo].[TabMotor_EmpresasVigente]([Periodo] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_EmpresasVigente]') AND name = 'IDX_BUSQRUT')
CREATE NONCLUSTERED INDEX [IDX_BUSQRUT] ON [dbo].[TabMotor_EmpresasVigente]([Empresa_Rut] ASC)