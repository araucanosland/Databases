IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_ListaEmpresaEjecutivo]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_ListaEmpresaEjecutivo]
GO

CREATE PROCEDURE [carteras].[spMotorCartera_ListaEmpresaEjecutivo] 
	-- Add the parameters for the stored procedure here
	 @TokenEjecutivo AS varchar(40)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	/****** Script para el comando SelectTopNRows de SSMS  ******/
SELECT IdEmpresaIngreso
	   ,EmpresaRut
	   ,EmpresaNombre
	   ,case when EmpresaTipoEjecutivo=1
	   then 'Ejecutivo Ventas'
	   else 'Ejecutivo Empresa Trabajador'
	   end EmpresaTipoEjecutivo
	   ,EmpresaRutEjecutivo
	   ,EmpresaNombreEjecutivo
	   ,cod_sucursal
  FROM [BD_HERRAMIENTAS].[carteras].[TabCart_IngresoCarteraEmpresa]
  where Cod_Sucursal=BD_REPORTES.negocios.fnSca_ObtenerOficinaByToken(@TokenEjecutivo)
  and EmpresaRut not in (select RutEmpresa from TabCart_IngresoCarteraEmpresaAdmin)
END