IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Instalacion]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Instalacion]
(
    [Id_instal] int NOT NULL,
    [Titulo] varchar(250) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Glosa] varchar(max) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Ruta] varchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [Tiempo] int NULL,
)