IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Asignacion_ObtenerByAfiliado]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Asignacion_ObtenerByAfiliado]
GO
CREATE PROCEDURE [dbo].[spMotor_Asignacion_ObtenerByAfiliado]
	@Periodo int ,
  @AfiliadoRut varchar(20)
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	select * 
	from TabMotor_Asignacion  with(index(idx_ObtenerByAfiliado))
	where periodo=@Periodo
	and CONVERT(VARCHAR(20),Afiliado_Rut) +'-'+Afiliado_Dv  =  @AfiliadoRut

END