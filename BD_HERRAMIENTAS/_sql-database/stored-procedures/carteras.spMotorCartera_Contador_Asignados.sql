IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Contador_Asignados]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Contador_Asignados]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Contador_Asignados] 
@IdEmpresaAnexo INT
AS
BEGIN
select count(IdEmpresaAnexo) TotalAsignados 
from BD_HERRAMIENTAS.[carteras].[TabCart_EjecAsigAnexo]  
where IdEmpresaAnexo = @IdEmpresaAnexo

End