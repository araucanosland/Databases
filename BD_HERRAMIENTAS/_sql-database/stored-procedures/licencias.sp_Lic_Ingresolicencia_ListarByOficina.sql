IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Ingresolicencia_ListarByOficina]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Ingresolicencia_ListarByOficina]
GO

CREATE PROCEDURE [licencias].[sp_Lic_Ingresolicencia_ListarByOficina](
	@CodOficina INT,
	@Dia DATE
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 28-09-2017 16:37:49
-- Tabla Principal        : TabLic_IngresoLicencia
-- Descripcion            : Lista todos los registros de la tabla TabLic_IngresoLicencia
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	--SELECT
	--	CodIngreso,
	--	RutAfiliado,
	--	NombreAfiliado,
	--	FolioLicencia,
	--	Oficina,
	--	RutEjecutivo,
	--	CodEstado,
	--	FechaIngreso,
	--	FormatoLM,
	--	FlagLM,
	--	CASE WHEN DATEDIFF(DAY, @Dia, GETDATE()) < 8 THEN 1 else 0 end Editable
	--FROM
	--	licencias.TabLic_IngresoLicencia
	--WHERE Oficina = @CodOficina
	--AND CONVERT(DATE,FechaIngreso) = @Dia
	set language spanish

		
	--Declare 
	--	 @CodOficina	INT		='137'
	--	,@Dia			DATE	='2018-06-05'
		

	
 

	 --IF OBJECT_ID('tempdb..#Resumen') IS NOT NULL    DROP TABLE #Resumen
	  	   /*
	SELECT distinct
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
			When a.FormatoLM='Manual' and B.Folio_Compara is not null And a.RutAfiliado<>b.Afiliado_Rut Then '2'
			When a.FormatoLM='Manual' and B.Folio_Compara is null										Then '3'		
			when a.FormatoLM='Mixta'																    Then '4'
		End FlagLM
		,A.OficinaDerivada
		--Into licencias.TabLic_IngresoLicenciaColor
		FROM
		licencias.TabLic_IngresoLicencia A
		LEFT JOIN [BD_HERRAMIENTAS].[licencias].[TabLic_CargaAS400] B
		ON A.FolioLicencia=B.Folio_Compara
		WHERE A.Oficina = @CodOficina
		AND CONVERT(DATE,A.FechaIngreso) = @Dia
		order by A.NombreAfiliado asc
		*/
		 	   
	SELECT distinct
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
			When a.FormatoLM='Manual' and B.Folio_Compara is not null And a.RutAfiliado<>b.Afiliado_Rut Then '2'
		    when a.FormatoLM='Manual' AND a.FolioLicencia= c.FoliosMTR									Then '5'
			When a.FormatoLM='Manual' and B.Folio_Compara is null										Then '3'
			when a.FormatoLM='Mixta'																    Then '4'
		End FlagLM
		,A.OficinaDerivada
		--Into licencias.TabLic_IngresoLicenciaColor
		FROM
		licencias.TabLic_IngresoLicencia A
		LEFT JOIN [BD_HERRAMIENTAS].[licencias].[TabLic_CargaAS400] B
		ON A.FolioLicencia=B.Folio_Compara and  a.RutAfiliado=b.Afiliado_Rut
		--on (RIGHT(a.FolioLicencia,7)=B.Folio_Compara and a.RutAfiliado=b.Afiliado_Rut) or (a.FolioLicencia=B.Folio_Compara and a.RutAfiliado=b.Afiliado_Rut)
		LEFT JOIN [BD_REPORTES].[lm].[Tab_Tracking_Ingreso_ControlAS400_difFolios] C
		on a.RutAfiliado=c.RutMTR
		WHERE A.Oficina = @CodOficina
		AND CONVERT(DATE,A.FechaIngreso) = @Dia
		--and a.FolioLicencia='32011660'
		order by A.NombreAfiliado asc
END