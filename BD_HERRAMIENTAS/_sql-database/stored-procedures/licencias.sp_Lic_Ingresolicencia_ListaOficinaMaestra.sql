IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Ingresolicencia_ListaOficinaMaestra]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Ingresolicencia_ListaOficinaMaestra]
GO
Create procedure [licencias].[sp_Lic_Ingresolicencia_ListaOficinaMaestra]
as


select 
	Cod_Oficina
	,Oficina
	,CodOficinaCompin
	,OficinaCompin
 from BD_HERRAMIENTAS.licencias.TabLic_MaeOficinas
		order by Cod_Oficina