IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Asignacion_ObtenerByEmpresa]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Asignacion_ObtenerByEmpresa]
GO


CREATE PROCEDURE [dbo].[spMotor_Asignacion_ObtenerByEmpresa]
	@Periodo AS int ,
  @EmpresaRut AS varchar(20)
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	select * 
	from TabMotor_Asignacion
	where periodo=@Periodo
	and CONVERT(VARCHAR(20),Empresa_Rut) + '-' + Empresa_Dv = @EmpresaRut

END