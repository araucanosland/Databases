IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Ingresolicencia_Listar]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Ingresolicencia_Listar]
GO
CREATE PROCEDURE [licencias].[sp_Lic_Ingresolicencia_Listar]
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
		RutAfiliado,
		NombreAfiliado,
		FolioLicencia,
		Oficina,
		RutEjecutivo,
		CodEstado,
		FechaIngreso,
		FormatoLM,
		CASE WHEN DATEDIFF(DAY, FechaIngreso, GETDATE()) < 8 THEN 1 else 0 end Editable
	FROM
		licencias.TabLic_IngresoLicencia
END