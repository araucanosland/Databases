IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Ingresolicencia_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Ingresolicencia_ObtenerPorID]
GO
CREATE PROCEDURE [licencias].[sp_Lic_Ingresolicencia_ObtenerPorID]
(
	@CodIngreso bigint
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 28-09-2017 16:37:38
-- Tabla Principal        : TabLic_IngresoLicencia
-- Descripcion            : Recupera un registro la TabLic_IngresoLicencia dado un CodIngreso
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT *,
		CASE WHEN DATEDIFF(DAY, FechaIngreso, GETDATE()) < 8 THEN 1 else 0 end Editable
	FROM
		TabLic_IngresoLicencia
	WHERE
		CodIngreso = @CodIngreso

END