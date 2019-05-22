IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Ingresolicencia_ListaCarga]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Ingresolicencia_ListaCarga]
GO
CREATE PROCEDURE [licencias].[sp_Lic_Ingresolicencia_ListaCarga]
AS

BEGIN
	SET NOCOUNT ON;


--truncate table select *[BD_HERRAMIENTAS].[licencias].[TabLic_CargaAS400] where folio_compara='57425903'
insert into  [BD_HERRAMIENTAS].[licencias].[TabLic_CargaAS400]
	select Periodo
		,FechaIngreso
		,Oficina
		,convert(varchar,Afiliado_Rut) +'-'+Afiliado_Dv  Afiliado_Rut
		,Licencia_folio
		,FechaInicio
		,Folio_operador
		,folio_folio
		,Folio_DV
		,Folio_Completo
		,Tipo
		,Folio_Compara
	 from [serv-55].[BD_REPORTES].[lm].[Tab_Tracking_Ingreso_ControlAS400] B
	 where tipo =''-- And Convert(date,Convert(varchar,FechaIngreso))>=Dateadd(d,-5,@dia)
	--and FechaIngreso=(select max(FechaIngreso) from [serv-55].[BD_REPORTES].[lm].[Tab_Tracking_Ingreso_ControlAS400])
	and Folio_Compara not in  (select Folio_Compara from [BD_HERRAMIENTAS].[licencias].[TabLic_CargaAS400] )


	update [BD_HERRAMIENTAS].[licencias].[TabLic_CargaAS400]
	set Afiliado_Rut=right(replicate('0', 10) + ltrim(Afiliado_Rut), 10) from [BD_HERRAMIENTAS].[licencias].[TabLic_CargaAS400]
	where LEN(Afiliado_Rut)=9


END



--select Periodo
	--	,FechaIngreso
	--	,Oficina
	--	,convert(varchar,Afiliado_Rut) +'-'+Afiliado_Dv  Afiliado_Rut
	--	,Licencia_folio
	--	,FechaInicio
	--	,Folio_operador
	--	,folio_folio
	--	,Folio_DV
	--	,Folio_Completo
	--	,Tipo
	--	,Folio_Compara
	-- from [serv-55].[BD_REPORTES].[lm].[Tab_Tracking_Ingreso_ControlAS400] B
	-- where tipo =''-- And Convert(date,Convert(varchar,FechaIngreso))>=Dateadd(d,-5,@dia)
	---- and Periodo=(select max(Periodo) from [serv-55].[BD_REPORTES].[lm].[Tab_Tracking_Ingreso_ControlAS400])
	--and Folio_Compara not in  (select Folio_Compara from [BD_HERRAMIENTAS].[licencias].[TabLic_CargaAS400])


	--and folio_compara='57425903'