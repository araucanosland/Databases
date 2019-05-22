IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[TabFicha_Encabezado]') AND type = 'U')
CREATE TABLE [fichas].[TabFicha_Encabezado]
(
    [enc_id] int NOT NULL IDENTITY(1, 1),
    [cuestionario_id] int NOT NULL,
    [rut_empresa] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
    [estamento] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
    [nombre_funcionario] varchar(150) COLLATE Modern_Spanish_CI_AS NULL,
    [cargo_funcionario] varchar(150) COLLATE Modern_Spanish_CI_AS NULL,
    [cantidad_empleados] int NULL,
    [cod_sucursal] int NOT NULL,
    [rut_ejecutivo] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [nombre_empresa] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    [fecha_entrevista] date NULL,
    [fecha_actualizacion] datetime NULL,
    [nombre_sucursal_empresa] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabFicha__2BFD44C572E607DB] PRIMARY KEY CLUSTERED ([enc_id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[fichas].[FK_QUEST_ENCAB]') AND parent_object_id = OBJECT_ID('[fichas].[TabFicha_Encabezado]'))
BEGIN
    ALTER TABLE [fichas].[TabFicha_Encabezado] WITH NOCHECK ADD CONSTRAINT [FK_QUEST_ENCAB] FOREIGN KEY ([cuestionario_id]) REFERENCES [fichas].[TabFicha_Cuestionario] ([cuest_id])
    ALTER TABLE [fichas].[TabFicha_Encabezado] CHECK CONSTRAINT [FK_QUEST_ENCAB]
END