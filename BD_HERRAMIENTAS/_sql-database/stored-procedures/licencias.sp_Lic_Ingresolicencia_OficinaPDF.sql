IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Ingresolicencia_OficinaPDF]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Ingresolicencia_OficinaPDF]
GO

CREATE PROCEDURE [licencias].[sp_Lic_Ingresolicencia_OficinaPDF](
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
	/*
	SELECT
		--CodIngreso,
		FolioLicencia,
		RutAfiliado,
		NombreAfiliado,
		CONVERT(VARCHAR(50),CONVERT(DATE,FechaIngreso)) FechaIngreso,
		--Oficina,
		RutEjecutivo,
		generales.EjecutivoNombreByRut(RutEjecutivo) NombreEjecutivo,
		--CodEstado,
		FormatoLM,
		SinDatosEnSistema
		--FormatoLM
	FROM licencias.TabLic_IngresoLicencia
	WHERE Oficina = @CodOficina
	AND CONVERT(DATE,FechaIngreso) = @Dia
	AND FormatoLM='Manual'
	ORDER BY NombreAfiliado  asc
			*/
		SELECT
		--CodIngreso,
		A.FolioLicencia,
		A.RutAfiliado,
		A.NombreAfiliado,
		CONVERT(VARCHAR(50),CONVERT(DATE,A.FechaIngreso)) FechaIngreso,
		--Oficina,
		A.RutEjecutivo,
		generales.EjecutivoNombreByRut(A.RutEjecutivo) NombreEjecutivo,
		--CodEstado,
		A.FormatoLM,
		A.SinDatosEnSistema,
		CASE 
			 WHEN A.FlagEstado=0 THEN 'NO' 
			 WHEN A.FlagEstado=1 THEN 'SI'
		     WHEN A.FlagEstado=2 THEN 'Recepcionado'
		END LmFueradeArea,
		CASE 
		 	 WHEN A.FlagEstado=0 THEN 'Sin Información' 
			 WHEN A.FlagEstado=1 THEN b.Oficina
		     WHEN A.FlagEstado=2 THEN 'Recepcionada Sucursal'
		End SucursalDestino 
		--FormatoLM
	FROM licencias.TabLic_IngresoLicencia A
	left join  BD_HERRAMIENTAS.dbo.TabMotor_Oficinas B
	ON A.OficinaDerivada=B.Cod_Oficina
	WHERE A.Oficina = @CodOficina
	AND CONVERT(DATE,A.FechaIngreso) = @Dia
	AND A.FormatoLM='Manual'
	ORDER BY A.NombreAfiliado  asc

END