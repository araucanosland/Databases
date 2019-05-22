IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[TabCart_IngresoCarteraEmpresa]') AND type = 'U')
CREATE TABLE [carteras].[TabCart_IngresoCarteraEmpresa]
(
    [EmpresaRut] varchar(10) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [EmpresaNombre] varchar(250) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [EmpresaTipoEjecutivo] int NOT NULL,
    [EmpresaRutEjecutivo] varchar(10) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [EmpresaNombreEjecutivo] varchar(250) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Periodo] varchar(6) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [Cod_Sucursal] int NULL,
    [EmpresaFechaIngreso] datetime NULL,
    [IdEmpresaIngreso] int NOT NULL IDENTITY(1, 1),
    [EmpresaFechaActualizacion] datetime NULL,
    [Id_EmpresaAdmin] int NULL,
    CONSTRAINT [PK__TabCart___684FA05926CFC035] PRIMARY KEY CLUSTERED ([IdEmpresaIngreso] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID('[carteras].[fk_EjecutivoEmpresa]') AND parent_object_id = OBJECT_ID('[carteras].[TabCart_IngresoCarteraEmpresa]'))
BEGIN
    ALTER TABLE [carteras].[TabCart_IngresoCarteraEmpresa] WITH CHECK ADD CONSTRAINT [fk_EjecutivoEmpresa] FOREIGN KEY ([EmpresaTipoEjecutivo]) REFERENCES [carteras].[TabCart_TipoEjecutivo] ([id_TipoCargo])
    ALTER TABLE [carteras].[TabCart_IngresoCarteraEmpresa] CHECK CONSTRAINT [fk_EjecutivoEmpresa]
END

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[carteras].[TabCart_IngresoCarteraEmpresa]') AND name = 'IndBusquedaRut')
CREATE NONCLUSTERED INDEX [IndBusquedaRut] ON [carteras].[TabCart_IngresoCarteraEmpresa](
    [EmpresaRut] ASC,
    [Periodo] ASC,
    [IdEmpresaIngreso] ASC
)