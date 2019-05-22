IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Nuberespuestas_Listar]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Nuberespuestas_Listar]
GO
CREATE PROCEDURE [fichas].[spFicha_Nuberespuestas_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:53:34
-- Tabla Principal        : TabFicha_NubeRespuestas
-- Descripcion            : Lista todos los registros de la tabla TabFicha_NubeRespuestas
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		nresp_id,
		despriccion,
		valor,
		tag
	FROM
		TabFicha_NubeRespuestas
END