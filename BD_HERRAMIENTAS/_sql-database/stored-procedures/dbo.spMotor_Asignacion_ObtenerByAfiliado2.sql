IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Asignacion_ObtenerByAfiliado2]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Asignacion_ObtenerByAfiliado2]
GO
create PROCEDURE [dbo].[spMotor_Asignacion_ObtenerByAfiliado2]
	@Periodo int ,
  @AfiliadoRut varchar(20),
	@TipoAsig INT
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	select * 
	from TabMotor_Asignacion  with(index(idx_ObtenerByAfiliado))
	where periodo=@Periodo
	and CONVERT(VARCHAR(20),Afiliado_Rut) +'-'+Afiliado_Dv  =  @AfiliadoRut
	and TipoAsignacion = @TipoAsig

END