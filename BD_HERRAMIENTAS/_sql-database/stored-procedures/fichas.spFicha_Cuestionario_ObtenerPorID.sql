IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Cuestionario_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Cuestionario_ObtenerPorID]
GO
CREATE PROCEDURE [fichas].[spFicha_Cuestionario_ObtenerPorID]
(
	@cuest_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:51:51
-- Tabla Principal        : TabFicha_Cuestionario
-- Descripcion            : Recupera un registro la TabFicha_Cuestionario dado un cuest_id
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
	WHERE
		cuest_id = @cuest_id

END