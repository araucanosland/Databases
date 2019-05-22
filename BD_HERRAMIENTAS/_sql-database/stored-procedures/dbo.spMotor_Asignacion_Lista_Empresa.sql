IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Asignacion_Lista_Empresa]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Asignacion_Lista_Empresa]
GO
CREATE PROCEDURE [dbo].[spMotor_Asignacion_Lista_Empresa](     
 --exec [dbo].[spMotor_Asignacion_Lista_Empresa] '4afb4982-88aa-4235-9a40-3b23d5373000'    
@TokenEjecutivo varchar(40))    
AS      
BEGIN    
 declare @RutEjec VARCHAR(50) = security.fnSca_ObtenerRutByToken(@TokenEjecutivo)    
 declare @OficinaEjec INT = security.fnSca_ObtenerOficinaByToken(@TokenEjecutivo)    
     
 select distinct Empresa from dbo.TabMotor_Asignacion     
  where Ejec_Asignacion = @RutEjec     
  and Empresa <> ''    
  and Oficina = @OficinaEjec     
  and Periodo = (select MAX(Periodo) from BD_Herramientas..TabMotor_Asignacion)    
  order by Empresa  
END