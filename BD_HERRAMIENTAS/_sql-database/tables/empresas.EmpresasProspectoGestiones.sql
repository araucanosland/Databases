IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[EmpresasProspectoGestiones]') AND type = 'U')
CREATE TABLE [empresas].[EmpresasProspectoGestiones]
(
    [Id] nvarchar(450) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [FechaGestion] datetime2(7) NOT NULL,
    [FechaProximaGestion] datetime2(7) NOT NULL,
    [Etapa] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [Comentarios] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [EmpresaProspectoRut] nvarchar(450) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK_EmpresasProspectoGestiones] PRIMARY KEY CLUSTERED ([Id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[empresas].[FK_EmpresasProspectoGestiones_EmpresasProspecto_EmpresaProspectoRut]') AND parent_object_id = OBJECT_ID('[empresas].[EmpresasProspectoGestiones]'))
BEGIN
    ALTER TABLE [empresas].[EmpresasProspectoGestiones] WITH CHECK ADD CONSTRAINT [FK_EmpresasProspectoGestiones_EmpresasProspecto_EmpresaProspectoRut] FOREIGN KEY ([EmpresaProspectoRut]) REFERENCES [empresas].[EmpresasProspecto] ([Rut])
    ALTER TABLE [empresas].[EmpresasProspectoGestiones] CHECK CONSTRAINT [FK_EmpresasProspectoGestiones_EmpresasProspecto_EmpresaProspectoRut]
END