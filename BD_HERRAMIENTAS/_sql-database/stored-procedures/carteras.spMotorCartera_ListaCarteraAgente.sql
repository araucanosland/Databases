IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_ListaCarteraAgente]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_ListaCarteraAgente]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_ListaCarteraAgente] 
@Token VARCHAR(50)
AS
BEGIN

DECLARE @RUT_EJECUTIVO VARCHAR(20) = security.fnSca_ObtenerRutByToken(@Token)
DECLARE @OFICINA VARCHAR(20) = security.fnSca_ObtenerOficinaByToken(@Token)

SELECT * FROM (
SELECT 
	B.IdSucursalEmpresa as ID
	,B.RutEmpresa
	,'Empresas' Tipo
	,B.NombreEmpresa
	,D.TipoEmpresa
	,D.NombreHolding
	,B.IdSucursalEmpresa
	,B.CodOficina
	,B.NTrabajador
	,B.Holding
	--,B.EjecutivoIngreso
	--,'' IdEmpresa
	,COUNT(C.RutEmpresa) CountAnexo
	,COUNT(E.RutEjectAsignado) CountEmp
	from BD_HERRAMIENTAS.carteras.TabCart_CarteraEmpresas B
	LEFT JOIN BD_HERRAMIENTAS.carteras.TabCart_Empresas D
	ON B.RutEmpresa = convert(varchar, D.RutEmpresa) + '-' + D.DvEmpresa   
	LEFT JOIN BD_HERRAMIENTAS.[carteras].[TabCart_AnexoEmpresa] C
	ON B.RutEmpresa = C.RutEmpresa and C.CodOficina = @OFICINA
	LEFT JOIN BD_HERRAMIENTAS.[carteras].[TabCart_EjecAsignacionEmpresa] E
	ON B.IdSucursalEmpresa = E.IdSucursalEmpresa  
	where b.CodOficina=@OFICINA --and C.CodOficina = @OFICINA
	group by b.IdSucursalEmpresa
			,B.RutEmpresa
			,B.NombreEmpresa
			,D.TipoEmpresa
			,D.NombreHolding
			,B.IdSucursalEmpresa
			,B.CodOficina
			,B.NTrabajador
			,B.Holding
			--,B.EjecutivoIngreso
	) x
order  by x.RutEmpresa asc


-- vista del agente
--select * from(
--select 
--		B.IdSucursalEmpresa as ID
--		,B.RutEmpresa
--		,'Empresas' Tipo
--		,B.NombreEmpresa
--		,D.TipoEmpresa
--		,D.NombreHolding
--		,B.IdSucursalEmpresa
--		,B.CodOficina
--		,B.NTrabajador
--		,B.Holding
--		,B.EjecutivoIngreso
--		,'' IdEmpresa
--     from BD_HERRAMIENTAS.carteras.TabCart_CarteraEmpresas B
--             LEFT JOIN BD_HERRAMIENTAS.carteras.TabCart_Empresas D
--             ON B.RutEmpresa = convert(varchar, D.RutEmpresa) + '-' + D.DvEmpresa   
--       where b.CodOficina=@OFICINA
--union all
--select idEmpresaAnexo as ID
--          ,RutEmpresa
--          ,'FAnexo' Tipo
--          ,Anexo
--          ,''TipoEmpresa
--          ,'ANEXO'NombreHolding
--          ,''SucursalEmpresa
--          ,CodOficina
--          ,NumTrabajadores as NTrabajador
--          ,''Holding
--          ,RutAgenteIngreso
--          ,IdEmpresaAnexo as IdEmpresa
--from BD_HERRAMIENTAS.[carteras].[TabCart_AnexoEmpresa] 
--where CodOficina=@OFICINA 
--)x
--where Tipo <> 'FAnexo'
--order by x.RutEmpresa 

END