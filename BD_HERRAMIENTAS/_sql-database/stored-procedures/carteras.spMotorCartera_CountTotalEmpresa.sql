IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_CountTotalEmpresa]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_CountTotalEmpresa]
GO
CREATE procedure [carteras].[spMotorCartera_CountTotalEmpresa]
(
@search varchar(200),@token varchar(200) 
)
  as

BEGIN
declare @oficina int = [bd_reportes].[negocios].[fnSca_ObtenerOficinaByToken](@Token) 
  select count(*) Total
	FROM [BD_HERRAMIENTAS].[carteras].[TabCart_Empresas]
  where ((len(@search) > 0 and (NombreEmpresa like '%'+@search+'%' or RutEmpresa + '-'+DvEmpresa like '%'+@search+'%' )  )	or len(@search)=0)	
  -- RutEmpresa + '-'+DvEmpresa not in (select RutEmpresa from [BD_HERRAMIENTAS].[carteras].[TabCart_IngresoCarteraEmpresaAdmin] where codoficina=@oficina )
	--and 
END