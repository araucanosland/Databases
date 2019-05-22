IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Attrvalores_ListarByCamp]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Attrvalores_ListarByCamp]
GO
CREATE PROCEDURE [engine].[sp_Attrvalores_ListarByCamp]
(
	@codCamp int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:30:53
-- Tabla Principal        : AttrValores
-- Descripcion            : Lista todos los registros de la tabla AttrValores
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		CodAttr,
	  codCamp,
		CodAsignacion,
		isnull(ValorAttr,'') ValorAttr
	FROM
		AttrValores
	WHERE codCamp = @codCamp
END