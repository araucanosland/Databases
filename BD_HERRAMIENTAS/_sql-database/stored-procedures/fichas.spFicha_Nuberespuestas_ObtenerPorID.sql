IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Nuberespuestas_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Nuberespuestas_ObtenerPorID]
GO
CREATE PROCEDURE [fichas].[spFicha_Nuberespuestas_ObtenerPorID]
(
	@nresp_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:53:24
-- Tabla Principal        : TabFicha_NubeRespuestas
-- Descripcion            : Recupera un registro la TabFicha_NubeRespuestas dado un nresp_id
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
	WHERE
		nresp_id = @nresp_id

END