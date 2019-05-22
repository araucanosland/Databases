IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_SeguimientoAtriculo_Obtener]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_SeguimientoAtriculo_Obtener]
GO
CREATE PROCEDURE [dbo].[spMotor_SeguimientoAtriculo_Obtener]
(
@Token varchar(50)
)
AS
BEGIN
  
 declare @Oficina int = security.fnSca_ObtenerOficinaByToken(@token)

	select *
	from dbo.TabMotor_SeguimientoArticulos
	where Oficina = @Oficina
	and CONVERT(DATE, FechaRegistro) = CONVERT(DATE, GETDATE())

END