IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Retencion_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Retencion_ObtenerPorID]
GO
CREATE PROCEDURE [empresas].[spEmp_Retencion_ObtenerPorID]
(
	@ret_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 10-04-2018 17:57:15
-- Tabla Principal        : TabEmp_Retencion
-- Descripcion            : Recupera un registro la TabEmp_Retencion dado un ret_id
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		ret_id,
		empresa_id,
		ret_estamento,
		ret_segmento,
		ret_dotacion,
		ret_caja_destino,
		ejecutivo_rut,
		oficina
	FROM
		TabEmp_Retencion
	WHERE
		ret_id = @ret_id

END