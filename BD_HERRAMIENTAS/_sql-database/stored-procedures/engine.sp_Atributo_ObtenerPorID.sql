IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Atributo_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Atributo_ObtenerPorID]
GO
CREATE PROCEDURE [engine].[sp_Atributo_ObtenerPorID]
(
	@CodAttr varchar(255)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:25:15
-- Tabla Principal        : Atributo
-- Descripcion            : Recupera un registro la Atributo dado un CodAttr
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		CodAttr,
		CodCamp,
		Etiqueta,
		TipoDato,
		MostrarEnLista
	FROM
		Atributo
	WHERE
		CodAttr = @CodAttr

END