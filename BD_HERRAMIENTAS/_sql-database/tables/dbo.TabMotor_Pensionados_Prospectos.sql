IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Pensionados_Prospectos]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Pensionados_Prospectos]
(
    [Rut_Pensionado] varchar(15) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Nombre] varchar(300) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Edad] int NOT NULL,
    [Caja_Origen] varchar(200) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Celular] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [Fono_Fijo] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [Email] varchar(300) COLLATE Modern_Spanish_CI_AS NULL,
    [Direccion_Calle] varchar(300) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Direccion_Numero] int NOT NULL,
    [Direccion_Dpto] varchar(30) COLLATE Modern_Spanish_CI_AS NULL,
    [Comuna] varchar(150) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Fecha_Accion] datetime NOT NULL,
    [Rut_Ejecutivo] varchar(15) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Cod_Sucursal] int NOT NULL,
    CONSTRAINT [PK__TabMotor__CBA80BB7062DE679] PRIMARY KEY CLUSTERED ([Rut_Pensionado] ASC)
)