IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[TabEmp_AmbitosArea]') AND type = 'U')
CREATE TABLE [empresas].[TabEmp_AmbitosArea]
(
    [ambito_id] int NOT NULL IDENTITY(1, 1),
    [ambito_nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [area_id] int NULL,
    CONSTRAINT [PK__TabEmp_A__B91BFB051EF99443] PRIMARY KEY CLUSTERED ([ambito_id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[empresas].[FK_AMBITO_AREA]') AND parent_object_id = OBJECT_ID('[empresas].[TabEmp_AmbitosArea]'))
BEGIN
    ALTER TABLE [empresas].[TabEmp_AmbitosArea] WITH CHECK ADD CONSTRAINT [FK_AMBITO_AREA] FOREIGN KEY ([area_id]) REFERENCES [empresas].[TabEmp_Areas] ([area_id])
    ALTER TABLE [empresas].[TabEmp_AmbitosArea] CHECK CONSTRAINT [FK_AMBITO_AREA]
END