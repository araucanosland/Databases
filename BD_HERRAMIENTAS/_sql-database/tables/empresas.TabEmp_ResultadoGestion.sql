IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[TabEmp_ResultadoGestion]') AND type = 'U')
CREATE TABLE [empresas].[TabEmp_ResultadoGestion]
(
    [resg_id] int NOT NULL IDENTITY(1, 1),
    [resg_tipo] varchar(100) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [resg_comentarios] varchar(150) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [resg_fecha] date NULL,
    [fidelizacion_id] int NOT NULL,
    CONSTRAINT [PK__TabEmp_R__D0F4D93C451F3D2B] PRIMARY KEY CLUSTERED ([resg_id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[empresas].[FK_DEP_FFIDELIZAT]') AND parent_object_id = OBJECT_ID('[empresas].[TabEmp_ResultadoGestion]'))
BEGIN
    ALTER TABLE [empresas].[TabEmp_ResultadoGestion] WITH CHECK ADD CONSTRAINT [FK_DEP_FFIDELIZAT] FOREIGN KEY ([fidelizacion_id]) REFERENCES [empresas].[TabEmp_Fidelizacion] ([fide_id])
    ALTER TABLE [empresas].[TabEmp_ResultadoGestion] CHECK CONSTRAINT [FK_DEP_FFIDELIZAT]
END