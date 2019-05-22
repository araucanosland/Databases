IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Contacto_Afiliado]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_Contacto_Afiliado]
(
    [Afiliado_rut] int NOT NULL,
    [Fecha_accion] datetime NOT NULL,
    [Tipo_contacto] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Valor_contacto] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Valido] tinyint NOT NULL,
    [Fecha_contacto] datetime NULL,
    CONSTRAINT [PK__TabMotor__D9C1DBB07E02B4CC] PRIMARY KEY CLUSTERED 
    (
        [Afiliado_rut] ASC,
        [Tipo_contacto] ASC,
        [Valor_contacto] ASC
    )
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Contacto_Afiliado]') AND name = 'Idx')
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[TabMotor_Contacto_Afiliado]([Valido] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Contacto_Afiliado]') AND name = 'IDX_RUT')
CREATE NONCLUSTERED INDEX [IDX_RUT] ON [dbo].[TabMotor_Contacto_Afiliado]([Afiliado_rut] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Contacto_Afiliado]') AND name = 'idx_validTipo')
CREATE NONCLUSTERED INDEX [idx_validTipo] ON [dbo].[TabMotor_Contacto_Afiliado](
    [Valido] ASC,
    [Tipo_contacto] ASC
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[dbo].[TabMotor_Contacto_Afiliado]') AND name = 'Idx2')
CREATE NONCLUSTERED INDEX [Idx2] ON [dbo].[TabMotor_Contacto_Afiliado](
    [Valido] ASC,
    [Tipo_contacto] ASC
)