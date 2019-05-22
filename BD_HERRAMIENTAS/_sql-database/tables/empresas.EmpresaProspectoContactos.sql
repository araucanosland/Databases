IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[EmpresaProspectoContactos]') AND type = 'U')
CREATE TABLE [empresas].[EmpresaProspectoContactos]
(
    [Id] nvarchar(450) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [TipoContacto] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [NombreContacto] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [Email] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [Celular] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [Telefono] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [Oficina] int NOT NULL,
    [Ejecutivo] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaIngreso] datetime2(7) NOT NULL,
    [EmpresaProspectoRut] nvarchar(450) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK_EmpresaProspectoContactos] PRIMARY KEY CLUSTERED ([Id] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[empresas].[FK_EmpresaProspectoContactos_EmpresasProspecto_EmpresaProspectoRut]') AND parent_object_id = OBJECT_ID('[empresas].[EmpresaProspectoContactos]'))
BEGIN
    ALTER TABLE [empresas].[EmpresaProspectoContactos] WITH CHECK ADD CONSTRAINT [FK_EmpresaProspectoContactos_EmpresasProspecto_EmpresaProspectoRut] FOREIGN KEY ([EmpresaProspectoRut]) REFERENCES [empresas].[EmpresasProspecto] ([Rut])
    ALTER TABLE [empresas].[EmpresaProspectoContactos] CHECK CONSTRAINT [FK_EmpresaProspectoContactos_EmpresasProspecto_EmpresaProspectoRut]
END