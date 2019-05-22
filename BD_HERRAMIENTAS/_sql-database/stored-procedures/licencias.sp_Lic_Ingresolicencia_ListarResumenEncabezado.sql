IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Ingresolicencia_ListarResumenEncabezado]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Ingresolicencia_ListarResumenEncabezado]
GO
--exec [licencias].[sp_Lic_Ingresolicencia_ListarResumenEncabezado] 84,'03-05-2018'
CREATE PROCEDURE [licencias].[sp_Lic_Ingresolicencia_ListarResumenEncabezado](
	@CodOficina INT,
	@Dia DATE
)
AS
BEGIN
	SET NOCOUNT ON;
		set language spanish

		
	--Declare 
	--	 @CodOficina	INT		='82'
	--	,@Dia			DATE	='2018-09-05'
		
	
		

	 IF OBJECT_ID('tempdb..#Resumen') IS NOT NULL    DROP TABLE #Resumen	

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
		CONVERT(VARCHAR(10), max(a.FechaIngreso), 103) + ' ' + CONVERT(VARCHAR(8), max(a.FechaIngreso), 108) Actualizacion,
		Case 
			when B.Folio_Compara is not null And a.RutAfiliado=b.Afiliado_Rut	Then '1'
			When B.Folio_Compara is not null And a.RutAfiliado<>b.Afiliado_Rut  Then '2'
			when a.FolioLicencia= c.FoliosMTR									Then '4'
			When B.Folio_Compara is null										Then '3'

		End FlagLM
		Into #Resumen
		FROM
		licencias.TabLic_IngresoLicencia A
		LEFT JOIN  [BD_HERRAMIENTAS].[licencias].[TabLic_CargaAS400] B
		--ON A.FolioLicencia=B.Folio_Compara and a.RutAfiliado=b.Afiliado_Rut
		on (RIGHT(a.FolioLicencia,7)=B.Folio_Compara and a.RutAfiliado=b.Afiliado_Rut) or (a.FolioLicencia=B.Folio_Compara and a.RutAfiliado=b.Afiliado_Rut)
		LEFT JOIN [BD_REPORTES].[lm].[Tab_Tracking_Ingreso_ControlAS400_difFolios] C
		on a.RutAfiliado=c.RutMTR
		WHERE A.Oficina = @CodOficina
		AND CONVERT(DATE,A.FechaIngreso) = @Dia
		AND a.FormatoLM='Manual'
		group by 
		A.CodIngreso, 
		A.RutAfiliado,
		A.NombreAfiliado,
		A.FolioLicencia,
		A.Oficina,
		A.RutEjecutivo,
		A.CodEstado,
		A.FechaIngreso,
		A.FormatoLM
	   ,Case 
			when B.Folio_Compara is not null And a.RutAfiliado=b.Afiliado_Rut	Then '1'
			When B.Folio_Compara is not null And a.RutAfiliado<>b.Afiliado_Rut  Then '2'
			when a.FolioLicencia= c.FoliosMTR									Then '4'
			When B.Folio_Compara is null										Then '3'	
		  	
		End 
		
	 IF OBJECT_ID('tempdb..#pivot') IS NOT NULL    DROP TABLE #pivot
	  	
		select *
		into #pivot
		from 
		(
			Select FlagLM,Count(1) 	Contador
			From #Resumen
			Group By FlagLM
		) src
		pivot
		(
			sum(Contador)
			for FlagLM in ([1], [2],[4] ,[3])
			
		) piv;
		
		select [1]
			  ,[2]
			  ,[4]
			  ,[3]
			  ,(select max(actualizacion) actualizacion from #Resumen
			 WHERE Oficina = @CodOficina
		     AND CONVERT(DATE,FechaIngreso) = @Dia
			  ) Actualizacion
		from #pivot




END





/*
	 IF OBJECT_ID('tempdb..#Resumen') IS NOT NULL    DROP TABLE #Resumen
	  	
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
		CONVERT(VARCHAR(10), max(a.FechaIngreso), 103) + ' ' + CONVERT(VARCHAR(8), max(a.FechaIngreso), 108) Actualizacion
		,Case 
			when B.Folio_Compara is not null And a.RutAfiliado=b.Afiliado_Rut	Then '1'
			When B.Folio_Compara is not null And a.RutAfiliado<>b.Afiliado_Rut  Then '2'
			When B.Folio_Compara is null										Then '3'		
		End FlagLM
		Into #Resumen
		FROM
		licencias.TabLic_IngresoLicencia A
		LEFT JOIN  [BD_HERRAMIENTAS].[licencias].[TabLic_CargaAS400] B
		ON A.FolioLicencia=B.Folio_Compara --and a.RutAfiliado=b.Afiliado_Rut
		WHERE A.Oficina = @CodOficina
		AND CONVERT(DATE,A.FechaIngreso) = @Dia
		AND a.FormatoLM='Manual'
		group by 
		A.CodIngreso,
		A.RutAfiliado,
		A.NombreAfiliado,
		A.FolioLicencia,
		A.Oficina,
		A.RutEjecutivo,
		A.CodEstado,
		A.FechaIngreso,
		A.FormatoLM
	   ,Case 
			when B.Folio_Compara is not null And a.RutAfiliado=b.Afiliado_Rut	Then '1'
			When B.Folio_Compara is not null And a.RutAfiliado<>b.Afiliado_Rut  Then '2'
			When B.Folio_Compara is null										Then '3'		
		End 
		
		
	 IF OBJECT_ID('tempdb..#pivot') IS NOT NULL    DROP TABLE #pivot
	  	
		select *
		into #pivot
		from 
		(
			Select FlagLM,Count(1) 	Contador
			From #Resumen
			Group By FlagLM
		) src
		pivot
		(
			sum(Contador)
			for FlagLM in ([1], [2], [3])
			
		) piv;
		
		select [1]
			  ,[2]
			  ,[3]
			  ,(select max(actualizacion) actualizacion from #Resumen
			  WHERE Oficina = @CodOficina
		      AND CONVERT(DATE,FechaIngreso) = @Dia
			  ) Actualizacion
		from #pivot

*/