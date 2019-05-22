IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Pregunta_Listar]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Pregunta_Listar]
GO
CREATE PROCEDURE [fichas].[spFicha_Pregunta_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:54:05
-- Tabla Principal        : TabFicha_Pregunta
-- Descripcion            : Lista todos los registros de la tabla TabFicha_Pregunta
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
END