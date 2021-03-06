IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_RolVerificador]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_RolVerificador]
(
    [Id] uniqueidentifier NOT NULL DEFAULT(newid()),
    [RutEjecutivo] varchar(12) COLLATE Modern_Spanish_CI_AS NULL,
    [CodSucursal] int NULL,
    [RutAfiliado] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [Anexo] int NULL,
    [RutEmpresa] varchar(15) COLLATE Modern_Spanish_CI_AS NULL,
    [NombreEmpresa] varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
    [Cotiza] bit NULL,
    [Grado] bit NULL,
    [SeguroCesantia] bit NULL,
    [ProEmpleo] bit NULL,
    [LeyEspecifica] bit NULL,
    [TotalHaberes] int NULL,
    [BonosExtras] int NULL,
    [DescuentoLegalMes1] int NULL,
    [DescuentoLegalMes2] int NULL,
    [DescuentoLegalMes3] int NULL,
    [Promedio] int NULL,
    [RentaDepurada] int NULL,
    [RentaDepuradaCMR] int NULL,
    [TotalDescuento] int NULL,
    [OtrosDescuentos] int NULL,
    [ValorCuotaCredito] int NULL,
    [ValorCuotaCreditoComp] int NULL,
    [Resultado1] varchar(350) COLLATE Modern_Spanish_CI_AS NULL,
    [Resultado2] varchar(350) COLLATE Modern_Spanish_CI_AS NULL,
    [FechaCreacion] datetime NULL,
    [LeyEspecifica2] bit NULL,
    CONSTRAINT [PK__TabMotor__3214EC070BE6BFCF] PRIMARY KEY CLUSTERED ([Id] ASC)
)