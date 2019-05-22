IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Ingresolicencia_OficinaXLS]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Ingresolicencia_OficinaXLS]
GO

CREATE PROCEDURE [licencias].[sp_Lic_Ingresolicencia_OficinaXLS](
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

	SELECT
		CodIngreso,
		FolioLicencia,
		RutAfiliado,
		NombreAfiliado,
		CONVERT(VARCHAR(50),CONVERT(DATE,FechaIngreso)) FechaIngreso,
		Oficina,
		RutEjecutivo,
		generales.EjecutivoNombreByRut(RutEjecutivo) NombreEjecutivo,
		CodEstado,
		
		FormatoLM,
		SinDatosEnSistema,
		 FormatoLM
	FROM licencias.TabLic_IngresoLicencia
	WHERE Oficina = @CodOficina
	AND CONVERT(DATE,FechaIngreso) = @Dia
	AND FormatoLM='Manual'
	ORDER BY NombreAfiliado  asc
END