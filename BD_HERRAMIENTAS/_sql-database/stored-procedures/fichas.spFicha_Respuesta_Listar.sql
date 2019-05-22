IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Respuesta_Listar]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Respuesta_Listar]
GO
CREATE PROCEDURE [fichas].[spFicha_Respuesta_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:54:31
-- Tabla Principal        : TabFicha_Respuesta
-- Descripcion            : Lista todos los registros de la tabla TabFicha_Respuesta
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
END