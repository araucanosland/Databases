IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_FiltrosRSG]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_FiltrosRSG]
(
    [Periodo] int NOT NULL,
    [AfiliadoRut] varchar(20) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [EmpresaRut] varchar(20) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Filtros] varchar(200) COLLATE Modern_Spanish_CI_AS NOT NULL,
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_FiltrosRSG]') AND name = 'IDX_BQDA_FRTA')
CREATE NONCLUSTERED INDEX [IDX_BQDA_FRTA] ON [dbo].[TabMotor_FiltrosRSG](
    [Periodo] ASC,
    [AfiliadoRut] ASC,
    [EmpresaRut] ASC
)