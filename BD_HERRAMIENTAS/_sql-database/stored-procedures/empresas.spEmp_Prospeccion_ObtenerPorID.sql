IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Prospeccion_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Prospeccion_ObtenerPorID]
GO
CREATE PROCEDURE [empresas].[spEmp_Prospeccion_ObtenerPorID]
(
	@pros_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-04-2018 14:16:10
-- Tabla Principal        : TabEmp_Prospeccion
-- Descripcion            : Recupera un registro la TabEmp_Prospeccion dado un pros_id
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		pros_id,
		empresa_id,
		pros_dotacion,
		pros_caja_origen,
		ejecutivo_rut,
		oficina
	FROM
		TabEmp_Prospeccion
	WHERE
		pros_id = @pros_id

END