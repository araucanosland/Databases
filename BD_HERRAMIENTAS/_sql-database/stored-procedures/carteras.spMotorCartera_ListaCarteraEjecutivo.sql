IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_ListaCarteraEjecutivo]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_ListaCarteraEjecutivo]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_ListaCarteraEjecutivo]--'45f646e8-5254-4860-a87f-2831e9862b1d'
@Token VARCHAR(50)
AS
BEGIN

DECLARE @RUT_EJECUTIVO VARCHAR(20) = security.fnSca_ObtenerRutByToken(@Token)
DECLARE @OFI_EJECUTIVO INT = security.fnSca_ObtenerOficinaByToken(@Token)

select distinct * from(
select 
		B.IdSucursalEmpresa as ID
       ,B.RutEmpresa
       ,'Empresas' Tipo
       ,B.NombreEmpresa
       ,C.Nombre
       ,D.TipoEmpresa
       ,D.NombreHolding
       ,B.IdSucursalEmpresa
       --,B.SucursalEmpresa
		,B.CodOficina
		,B.NTrabajador
		,B.Holding
		--,B.Comentarios
		--,B.FechaIngreso
		,B.EjecutivoIngreso
		,'' IdEmpresa
       from BD_HERRAMIENTAS.carteras.TabCart_EjecAsignacionEmpresa A
       --LEFT JOIN BD_HERRAMIENTAS.carteras.TabCart_IngresoCarteraEmpresaAdmin B
       LEFT JOIN BD_HERRAMIENTAS.carteras.TabCart_CarteraEmpresas B
             ON A.IdSucursalEmpresa=B.IdSucursalEmpresa
             LEFT JOIN BD_HERRAMIENTAS.carteras.TabCart_Empresas D
             ON B.RutEmpresa = convert(varchar, D.RutEmpresa) + '-' + D.DvEmpresa   
       LEFT JOIN BD_HERRAMIENTAS.DBO.TabMotor_Dotacion C
             ON A.RutEjectAsignado=C.Rut AND C.Periodo=dbo.fnMotor_ObtenerPeriodoActual()
       --inner JOIN BD_HERRAMIENTAS.[carteras].[TabCart_EjecAsignacionEmpresa] E
       --      ON E.RutEjectAsignado=C.Rut       
       where A.RutEjectAsignado=@RUT_EJECUTIVO 
				and B.CodOficina = @OFI_EJECUTIVO
union all
select A.idEmpresaAnexo as ID
            ,A.RutEmpresa
          ,'FAnexo' Tipo
          ,(A.Anexo + ' - (' + A.NombreEmpresa + ')') as Anexo
          ,''Nombre
          ,''TipoEmpresa
          ,'ANEXO'NombreHolding
          ,''IdSucursalEmpresa
          --,''SucursalEmpresa
          ,A.CodOficina
          ,A.NumTrabajadores as NTrabajador
          ,''Holding
          --,''Comentarios
          --,''FechaIngreso
          ,A.RutAgenteIngreso
           ,A.IdEmpresaAnexo as IdEmpresa
from BD_HERRAMIENTAS.[carteras].[TabCart_AnexoEmpresa] A
left join BD_HERRAMIENTAS.carteras.TabCart_EjecAsigAnexo B
on a.idEmpresaAnexo=b.idempresaanexo
where RutejecutivoAsigAnexo = @RUT_EJECUTIVO
and A.CodOficina = @OFI_EJECUTIVO
)x
where Tipo = 'FAnexo'
order by x.RutEmpresa
		
END