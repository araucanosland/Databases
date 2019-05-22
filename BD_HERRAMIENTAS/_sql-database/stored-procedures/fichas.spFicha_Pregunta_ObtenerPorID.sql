IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Pregunta_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Pregunta_ObtenerPorID]
GO
CREATE PROCEDURE [fichas].[spFicha_Pregunta_ObtenerPorID]
(
	@preg_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:53:53
-- Tabla Principal        : TabFicha_Pregunta
-- Descripcion            : Recupera un registro la TabFicha_Pregunta dado un preg_id
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		preg_id,
		cuestionario_id,
		titulo,
		item,
		pregunta_relacionada
	FROM
		TabFicha_Pregunta
	WHERE
		preg_id = @preg_id

END