IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_datos_anexo]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_datos_anexo]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Lista_datos_anexo] 
@IdEmpresaAnexo INT
AS
BEGIN

SELECT A.IdEmpresaAnexo
	,A.RutEmpresa
	,A.Anexo
	,A.NombreEmpresa
	,A.NumTrabajadores
	,A.Direccion
	,A.IdComuna 
	,A.EsMatriz
	,count(B.IdEmpresaAnexo) TotalAsignados
	
FROM BD_HERRAMIENTAS.[carteras].[TabCart_AnexoEmpresa] A
LEFT JOIN BD_HERRAMIENTAS.[carteras].[TabCart_EjecAsigAnexo] B
ON A.IdEmpresaAnexo = B.IdEmpresaAnexo
WHERE A.IdEmpresaAnexo = @IdEmpresaAnexo
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

END