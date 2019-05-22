IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ObtenerBaseCampagna]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ObtenerBaseCampagna]
GO
CREATE PROCEDURE [dbo].[spMotor_ObtenerBaseCampagna]
  @Periodo AS int ,
  @RutAfiliado AS int 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	select * 
	from TabMotor_BaseCampagna
	where periodo=@Periodo
	and afi_rut = @RutAfiliado


END