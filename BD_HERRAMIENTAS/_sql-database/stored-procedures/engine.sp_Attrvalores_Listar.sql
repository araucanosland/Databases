IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Attrvalores_Listar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Attrvalores_Listar]
GO
CREATE PROCEDURE [engine].[sp_Attrvalores_Listar]
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
		CodCamp,
		CodAsignacion,
		isnull(ValorAttr,'') ValorAttr
	FROM
		AttrValores
END