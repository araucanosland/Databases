IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_EjecutivoAsigEmpresa]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_EjecutivoAsigEmpresa]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Lista_EjecutivoAsigEmpresa] 
@ID_EMPRESA INT
AS
BEGIN

SELECT DISTINCT RutEjectAsignado FROM BD_HERRAMIENTAS.[carteras].[TabCart_EjecAsignacionEmpresa] 
WHERE IdSucursalEmpresa = @ID_EMPRESA
union all
SELECT DISTINCT RutEjecutivoAsigAnexo FROM BD_HERRAMIENTAS.[carteras].[TabCart_EjecAsigAnexo] 
WHERE IdEmpresaAnexo = @ID_EMPRESA


END