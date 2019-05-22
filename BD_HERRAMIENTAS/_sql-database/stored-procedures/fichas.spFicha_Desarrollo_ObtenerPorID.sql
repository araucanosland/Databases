IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Desarrollo_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Desarrollo_ObtenerPorID]
GO
CREATE PROCEDURE [fichas].[spFicha_Desarrollo_ObtenerPorID]
(
	@desa_id bigint
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:52:27
-- Tabla Principal        : TabFicha_Desarrollo
-- Descripcion            : Recupera un registro la TabFicha_Desarrollo dado un desa_id
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		desa_id,
		encabezado_id,
		respuesta_id,
		texto
	FROM
		TabFicha_Desarrollo
	WHERE
		desa_id = @desa_id

END