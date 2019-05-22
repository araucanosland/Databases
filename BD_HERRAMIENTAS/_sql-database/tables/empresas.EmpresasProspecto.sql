IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[EmpresasProspecto]') AND type = 'U')
CREATE TABLE [empresas].[EmpresasProspecto]
(
    [Rut] nvarchar(450) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Nombre] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [Comuna] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [Direccion] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [CajaOrigen] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [CantidadTrabajadores] int NOT NULL,
    [Rubro] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [Segmento] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [Categoria] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaIngreso] datetime2(7) NOT NULL,
    [Oficina] int NOT NULL,
    [Ejecutivo] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [RutHolding] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [NombreHolding] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    [Region] nvarchar(max) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK_EmpresasProspecto] PRIMARY KEY CLUSTERED ([Rut] ASC)
)