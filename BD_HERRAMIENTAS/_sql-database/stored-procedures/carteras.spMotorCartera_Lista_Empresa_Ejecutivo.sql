IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_Empresa_Ejecutivo]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_Empresa_Ejecutivo]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Lista_Empresa_Ejecutivo] --'16050456-0'
@RUT_EJECUTIVO VARCHAR(100)
AS 
BEGIN

      
select * from(
select A.idEmpresaAnexo as ID
            ,A.RutEmpresa as RutEmpresa
          ,NombreEmpresa + ' - ' + anexo as NombreEmpresa
           ,A.IdEmpresaAnexo as IdEmpresa
      from BD_HERRAMIENTAS.[carteras].[TabCart_AnexoEmpresa] A
left join BD_HERRAMIENTAS.carteras.TabCart_EjecAsigAnexo B
on a.idEmpresaAnexo=b.idempresaanexo
where RutejecutivoAsigAnexo = @RUT_EJECUTIVO
)x
order by x.RutEmpresa
      

END