IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_ListarContactoEmpresa]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_ListarContactoEmpresa]
GO


CREATE PROCEDURE [carteras].[spMotorCartera_ListarContactoEmpresa]
@Token AS varchar(40),
@RutEmpresa as varchar(15)
as
select
 A.IdContactoEmpresa
,A.RutEmpresa
,A.IdAnexo
,A.RutContacto
,A.NombreContacto
,A.CargoContacto
,A.TelefonoContacto
,A.CelularContacto
,A.EmailContacto
,case when a.IdEstamento=1 then 'Sindicato'
when a.IdEstamento=2 then 'Empresa'
end NombreEstamento
from BD_HERRAMIENTAS.carteras.TabCart_IngresoContacto A
left join BD_HERRAMIENTAS.carteras.TabCart_CarteraEmpresas B
on A.RutEmpresa=b.RutEmpresa
where A.RutEmpresa=@RutEmpresa and CodOficina=BD_REPORTES.negocios.fnSca_ObtenerOficinaByToken(@Token)