IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Attrvalores_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Attrvalores_ObtenerPorID]
GO
CREATE PROCEDURE [engine].[sp_Attrvalores_ObtenerPorID]
(
	@CodAttr varchar(255)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:30:45
-- Tabla Principal        : AttrValores
-- Descripcion            : Recupera un registro la AttrValores dado un CodAttr
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
		CodAsignacion,
		ValorAttr
	FROM
		AttrValores
	WHERE
		CodAttr = @CodAttr

END