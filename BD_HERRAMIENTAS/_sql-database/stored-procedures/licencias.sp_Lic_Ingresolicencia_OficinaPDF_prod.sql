IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Ingresolicencia_OficinaPDF_prod]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Ingresolicencia_OficinaPDF_prod]
GO

CREATE PROCEDURE [licencias].[sp_Lic_Ingresolicencia_OficinaPDF_prod](
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
		CASE WHEN A.FlagEstado= 1 THEN 'SI'
		ELSE 'NO' END LmFueradeArea,
		b.Oficina SucursalDestino
		--FormatoLM
	FROM licencias.TabLic_IngresoLicencia A
	left join  BD_HERRAMIENTAS.dbo.TabMotor_Oficinas B
	ON A.OficinaDerivada=B.Cod_Oficina
	WHERE A.Oficina = @CodOficina
	AND CONVERT(DATE,A.FechaIngreso) = @Dia
	AND A.FormatoLM='Manual'
	ORDER BY A.NombreAfiliado  asc
END