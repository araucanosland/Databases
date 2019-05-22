IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Listar_GestionByAsignacion]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Listar_GestionByAsignacion]
GO
CREATE PROCEDURE [dbo].[spMotor_Listar_GestionByAsignacion]
	@IdAsignacion AS int
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	select * 
	from TabMotor_Gestion
	where ges_bcam_uid=@IdAsignacion
	and ges_estado_gst<>0
	order by ges_fecha_accion desc
END