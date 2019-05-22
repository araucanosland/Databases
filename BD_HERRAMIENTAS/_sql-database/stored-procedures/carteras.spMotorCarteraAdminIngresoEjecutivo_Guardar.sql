IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCarteraAdminIngresoEjecutivo_Guardar]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCarteraAdminIngresoEjecutivo_Guardar]
GO
create procedure [carteras].[spMotorCarteraAdminIngresoEjecutivo_Guardar]
(
	@IdEmpresaIngreso int,
	@rutEjecutivo varchar(250)
)
AS
INSERT INTO [carteras].[TabCart_EjecAsignacion]
           ([IdSucursalEmpresa]
           ,[RutEjecAsignado]
           ,[NombreEjecAsignado])
     VALUES
           (
		   @IdEmpresaIngreso
		   ,@rutEjecutivo
		   ,''
		   )