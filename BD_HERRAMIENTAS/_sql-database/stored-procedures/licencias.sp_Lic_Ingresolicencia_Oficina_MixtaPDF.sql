IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Ingresolicencia_Oficina_MixtaPDF]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Ingresolicencia_Oficina_MixtaPDF]
GO

CREATE PROCEDURE [licencias].[sp_Lic_Ingresolicencia_Oficina_MixtaPDF](
	@CodOficina INT,
	@Dia DATE
)
AS

BEGIN
	SET NOCOUNT ON;

		SELECT
		FolioLicencia,
		RutAfiliado,
		NombreAfiliado,
		CONVERT(VARCHAR(50),CONVERT(DATE,FechaIngreso)) FechaIngreso,
		RutEjecutivo,
		generales.EjecutivoNombreByRut(RutEjecutivo) NombreEjecutivo,
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
	FROM licencias.TabLic_IngresoLicencia A
	left join  BD_HERRAMIENTAS.dbo.TabMotor_Oficinas B
	ON A.OficinaDerivada=B.Cod_Oficina
	WHERE A.Oficina = @CodOficina
	AND CONVERT(DATE,A.FechaIngreso) = @Dia
	AND FormatoLM='Mixta'
	ORDER BY NombreAfiliado  asc
	
END