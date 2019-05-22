IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Contador_Anexos]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Contador_Anexos]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Contador_Anexos] --'61502000-1'
@RutEmpresa varchar(12)
AS
BEGIN
select COUNT(RutEmpresa) TotalAnexos
from BD_HERRAMIENTAS.[carteras].[TabCart_AnexoEmpresa]
where RutEmpresa = @RutEmpresa

End