IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_ListAnexoEmpresa]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_ListAnexoEmpresa]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_ListAnexoEmpresa]--'96522500-5',104
 @RUT_EMPRESA VARCHAR(20)
,@COD_OFIC INT
AS
BEGIN
	select  
			 RutEmpresa 
			,NombreEmpresa 
			,Anexo 
			,NumTrabajadores 
			,CodOficina 
			,IdComuna 
			,NombreComuna
			,Direccion 
			,RutEjecutivo 
			,FechaCreacion
	from BD_HERRAMIENTAS.[carteras].[TabCart_AnexoEmpresa]
	where RutEmpresa =@RUT_EMPRESA and CodOficina = @COD_OFIC
END