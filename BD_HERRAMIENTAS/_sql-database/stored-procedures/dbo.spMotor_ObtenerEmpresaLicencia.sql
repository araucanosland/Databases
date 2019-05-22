IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ObtenerEmpresaLicencia]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ObtenerEmpresaLicencia]
GO
CREATE procedure [dbo].[spMotor_ObtenerEmpresaLicencia]
as
BEGIN
Select  distinct Periodo
		         ,Empresa_Rut
		         ,Empresa_Dv
		         ,Rut_Dv
		         ,EmpresaNombre
		          From BD_HERRAMIENTAS..TabMotor_EmpresasVigente
--where Periodo=(select max(periodo) From BD_REPORTERIA..TabRepo_Mapa_Empresas)--8645
where Periodo=(select max(periodo) From BD_HERRAMIENTAS..TabMotor_EmpresasVigente)--8645



END