IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_ListaEmpresaEjecutivoAdmin]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_ListaEmpresaEjecutivoAdmin]
GO

CREATE PROCEDURE [carteras].[spMotorCartera_ListaEmpresaEjecutivoAdmin] 
	-- Add the parameters for the stored procedure here
	 @TokenEjecutivo AS varchar(40)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	/****** Script para el comando SelectTopNRows de SSMS  ******/
SELECT [IdSucursalEmpresa]
      ,[SucursalEmpresa]
      ,[RutEmpresa]
      ,[NombreEmpresa]
      ,[CodOficina]
      ,[NTrabajador]
      ,[Holding]
      ,[Comentarios]
      ,[FechaIngreso]
      ,[EjecutivoIngreso]
  FROM [BD_HERRAMIENTAS].[carteras].[TabCart_IngresoCarteraEmpresaAdmin]
  where [CodOficina]=BD_REPORTES.negocios.fnSca_ObtenerOficinaByToken(@TokenEjecutivo)
END