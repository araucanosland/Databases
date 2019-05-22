IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_ListaTotalEmpresa]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_ListaTotalEmpresa]
GO
  CREATE procedure [carteras].[spMotorCartera_ListaTotalEmpresa]
(
@offset int, @limit int, @search varchar(200),@token varchar(200) 
)
  as
BEGIN
declare @oficina int = [bd_reportes].[negocios].[fnSca_ObtenerOficinaByToken](@Token) 
select * from (
  select 
	ROW_NUMBER() OVER (ORDER BY NombreEmpresa) pos,
  RutEmpresa + '-'+DvEmpresa  as RutEmpresa
  ,NombreEmpresa AS EmpresaNombre
  FROM [BD_HERRAMIENTAS].[carteras].[TabCart_Empresas]
   where((len(@search) > 0 and (NombreEmpresa like '%'+@search+'%' or RutEmpresa + '-'+DvEmpresa like '%'+@search+'%' )  )	or len(@search)=0)	
   --  RutEmpresa + '-'+DvEmpresa not in (select RutEmpresa from [BD_HERRAMIENTAS].[carteras].[TabCart_IngresoCarteraEmpresaAdmin] where codoficina=@oficina )
	--and 
) x
where pos between @offset + 1 and @offset + @limit

END