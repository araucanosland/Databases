IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Asignacion_ListarByOficina]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Asignacion_ListarByOficina]
GO
CREATE PROCEDURE [dbo].[spMotor_Asignacion_ListarByOficina]
	@Periodo AS int ,
  @TokenEjecutivo AS varchar(40)
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	declare @Ofi INT= security.fnSca_ObtenerOficinaByToken(@TokenEjecutivo)

	select * 
	from TabMotor_Asignacion
	where periodo=@Periodo
	and Oficina = @Ofi


END