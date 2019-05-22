IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Anexo]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Anexo]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Anexo] 
@RUT_EMPRESA VARCHAR(50)
,@Token VARCHAR(50)
AS
BEGIN
DECLARE @OFICINA VARCHAR(20) = security.fnSca_ObtenerOficinaByToken(@Token)

SELECT A.IdEmpresaAnexo
		,A.RutEmpresa
		,A.NombreEmpresa
		,A.Anexo
		,A.NumTrabajadores
		,A.CodOficina
		,A.IdComuna
		,A.NombreComuna
		,A.Direccion
		,A.EsMatriz
		,count( DISTINCT B.IdEmpresaAnexo) TotalAsignados
FROM BD_HERRAMIENTAS.[carteras].[TabCart_AnexoEmpresa] A
LEFT JOIN BD_HERRAMIENTAS.[carteras].[TabCart_EjecAsigAnexo] B
ON A.IdEmpresaAnexo = B.IdEmpresaAnexo
WHERE RutEmpresa = @RUT_EMPRESA
AND CodOficina = @OFICINA
GROUP BY A.IdEmpresaAnexo
		,A.RutEmpresa
		,A.NombreEmpresa
		,A.Anexo
		,A.NumTrabajadores
		,A.CodOficina
		,A.IdComuna
		,A.NombreComuna
		,A.Direccion
		,A.EsMatriz

ORDER BY A.EsMatriz DESC

END