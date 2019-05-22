IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_ListaPerfilEjecutivoAnexo]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_ListaPerfilEjecutivoAnexo]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_ListaPerfilEjecutivoAnexo] --1
@ID_EMPRESA INT
AS
BEGIN
	select A.RutEjecAsignado
	,C.Nombre
	,D.TipoEmpresa
	,D.NombreHolding 
	,B.* 
	,CASE dbo.FN_getEdad(E.EmprIniVigencia)
		WHEN 0  THEN 'Menos de un año'
			ELSE convert(varchar, dbo.FN_getEdad(E.EmprIniVigencia)) + ' años' 
		END as FechaAntiguedad
	,AN.Anexo	
	,an.NumTrabajadores
		
	from BD_HERRAMIENTAS.carteras.TabCart_EjecAsignacion A
	LEFT JOIN BD_HERRAMIENTAS.carteras.TabCart_IngresoCarteraEmpresaAdmin B
	--LEFT JOIN BD_HERRAMIENTAS.carteras.TabCart_CarteraEmpresas B
	ON A.IdSucursalEmpresa=B.IdSucursalEmpresa
	LEFT JOIN BD_HERRAMIENTAS.carteras.TabCart_Empresas D
	ON B.RutEmpresa = convert(varchar, D.RutEmpresa) + '-' + D.DvEmpresa   
	LEFT JOIN BD_HERRAMIENTAS.DBO.TabMotor_Dotacion C
	ON A.RutEjecAsignado=C.Rut AND C.Periodo=dbo.fnMotor_ObtenerPeriodoActual()
	LEFT JOIN BD_HERRAMIENTAS.mae.Empresas E 
	ON B.RutEmpresa = convert(varchar, E.RutEmpresa) + '-' + E.DvEmpresa 
	
	LEFT JOIN BD_HERRAMIENTAS.[carteras].[TabCart_AnexoEmpresa] AN
	ON B.RutEmpresa = AN.RutEmpresa
	where AN.IdEmpresaAnexo = @ID_EMPRESA

END