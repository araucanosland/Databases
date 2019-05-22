IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Ingresolicencia_ListarByOficina_desa]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Ingresolicencia_ListarByOficina_desa]
GO

--exec [licencias].[sp_Lic_Ingresolicencia_ListarByOficina_desa] 52,'19-02-2018'
CREATE PROCEDURE [licencias].[sp_Lic_Ingresolicencia_ListarByOficina_desa](
	@CodOficina INT,
	@Dia DATE
)
AS
BEGIN
	SET NOCOUNT ON;
		set language spanish

		
/*	Declare 
		 @CodOficina	INT		='82'
		,@Dia			DATE	='2018-02-22'
*/		

	IF OBJECT_ID('tempdb..#GrillAS400') IS NOT NULL    DROP TABLE #GrillAS400

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
	 into #GrillAS400
	 from [BD_REPORTES].[lm].[Tab_Tracking_Ingreso_ControlAS400] B
	 where tipo ='' And Convert(date,Convert(varchar,FechaIngreso))>=Dateadd(d,-5,@dia)
	
	update #GrillAS400
	set Afiliado_Rut=right(replicate('0', 10) + ltrim(Afiliado_Rut), 10) from #GrillAS400--
	where LEN(Afiliado_Rut)=9

 

	 --IF OBJECT_ID('tempdb..#Resumen') IS NOT NULL    DROP TABLE #Resumen
	  	   
	SELECT
		A.CodIngreso,
		A.RutAfiliado,
		A.NombreAfiliado,
		A.FolioLicencia,
		A.Oficina,
		A.RutEjecutivo,
		A.CodEstado,
		A.FechaIngreso,
		A.FormatoLM,
		Case 
			when a.FormatoLM='Manual' and B.Folio_Compara is not null And a.RutAfiliado=b.Afiliado_Rut	Then '1'
			When a.FormatoLM='Manual' and B.Folio_Compara is not null And a.RutAfiliado<>b.Afiliado_Rut  Then '2'
			When a.FormatoLM='Manual' and B.Folio_Compara is null										Then '3'		
			when a.FormatoLM='Mixta'																    then '4'
		End FlagLM,
		A.OficinaDerivada
		--Into #Resumen
		FROM
		licencias.TabLic_IngresoLicencia_desa A
		LEFT JOIN #GrillAS400 B
		ON A.FolioLicencia=B.Folio_Compara --and a.RutAfiliado=b.Afiliado_Rut
		WHERE A.Oficina = @CodOficina
		AND CONVERT(DATE,A.FechaIngreso) = @Dia
		order by A.NombreAfiliado asc

	

END