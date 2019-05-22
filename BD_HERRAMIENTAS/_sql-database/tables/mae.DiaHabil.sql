IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[DiaHabil]') AND type = 'U')
CREATE TABLE [mae].[DiaHabil]
(
    [Fecha] date NOT NULL,
    [FechaAMD] varchar(30) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaCL] varchar(10) COLLATE Modern_Spanish_CI_AS NULL,
    [Nombre] nvarchar(25) COLLATE Modern_Spanish_CI_AS NULL,
    [Dia_Habil] int NULL,
    [Dia_Habil_Desc] int NOT NULL,
    [Dia_Habil_Mes] int NOT NULL,
    [Tipo_Dia] nvarchar(1) COLLATE Modern_Spanish_CI_AS NULL,
    [Nombre_Mes] varchar(10) COLLATE Modern_Spanish_CI_AS NULL,
    [D] varchar(2) COLLATE Modern_Spanish_CI_AS NULL,
    [M] varchar(2) COLLATE Modern_Spanish_CI_AS NULL,
    [A] varchar(4) COLLATE Modern_Spanish_CI_AS NULL,
    [Periodo] varchar(6) COLLATE Modern_Spanish_CI_AS NULL,
)