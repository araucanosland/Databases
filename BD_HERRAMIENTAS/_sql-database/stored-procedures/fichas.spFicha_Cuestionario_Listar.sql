IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Cuestionario_Listar]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Cuestionario_Listar]
GO
CREATE PROCEDURE [fichas].[spFicha_Cuestionario_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:52:04
-- Tabla Principal        : TabFicha_Cuestionario
-- Descripcion            : Lista todos los registros de la tabla TabFicha_Cuestionario
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		cuest_id,
		descripcion
	FROM
		TabFicha_Cuestionario
END