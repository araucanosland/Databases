IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ListarBaseCampagnaByEjecutivo]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ListarBaseCampagnaByEjecutivo]
GO
CREATE PROCEDURE [dbo].[spMotor_ListarBaseCampagnaByEjecutivo]
	@Periodo AS int ,
  @TokenEjecutivo AS varchar(40)
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	select * 
	from TabMotor_BaseCampagna
	where periodo=@Periodo
	and ejec_rut = security.fnSca_ObtenerRutByToken(@TokenEjecutivo)

END