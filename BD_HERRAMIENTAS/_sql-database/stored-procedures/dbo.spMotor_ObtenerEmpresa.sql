IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ObtenerEmpresa]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ObtenerEmpresa]
GO
create procedure [dbo].[spMotor_ObtenerEmpresa]
@RutEmpresa INT,
@periodo varchar(10) 
as
begin
select Empresa_Rut,Empresa_Dv,Empresa_Nombre from TabMotor_Empresa
where Empresa_Rut=@RutEmpresa and Periodo=@periodo
end