IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Asignacion_ListarByEjecutivo]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Asignacion_ListarByEjecutivo]
GO
CREATE PROCEDURE [dbo].[spMotor_Asignacion_ListarByEjecutivo]
	@Periodo AS int ,
  @TokenEjecutivo AS varchar(40)
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	declare @RutEjec VARCHAR(50) = security.fnSca_ObtenerRutByToken(@TokenEjecutivo)

	select * 
	from TabMotor_Asignacion
	where periodo=@Periodo
	and Ejec_Asignacion = @RutEjec
	union 

	select DISTINCT a.* 
	from TabMotor_Asignacion a
	inner join TabMotor_Gestion b ON a.id_Asign = b.ges_bcam_uid and b.ges_ejecutivo_rut = @RutEjec
	where a.periodo=@Periodo


END