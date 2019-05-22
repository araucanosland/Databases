IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Respuesta_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Respuesta_ObtenerPorID]
GO
CREATE PROCEDURE [fichas].[spFicha_Respuesta_ObtenerPorID]
(
	@resp_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:54:25
-- Tabla Principal        : TabFicha_Respuesta
-- Descripcion            : Recupera un registro la TabFicha_Respuesta dado un resp_id
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		resp_id,
		nuberespuesta_id,
		pregunta_id
	FROM
		TabFicha_Respuesta
	WHERE
		resp_id = @resp_id

END