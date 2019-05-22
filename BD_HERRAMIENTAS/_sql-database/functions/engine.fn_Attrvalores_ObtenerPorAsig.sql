IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[fn_Attrvalores_ObtenerPorAsig]') AND type = 'FN')
DROP FUNCTION [engine].[fn_Attrvalores_ObtenerPorAsig]
GO
CREATE function [engine].[fn_Attrvalores_ObtenerPorAsig]
(
	@CodAsignacion INT,
	@CodAttr VARCHAR(100)
)
RETURNS VARCHAR (300)
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


	DECLARE @RET VARCHAR(300)


	SELECT @RET = ValorAttr
	FROM
		AttrValores
	WHERE
		CodAsignacion = @CodAsignacion
	AND 
		CodAttr = @CodAttr


	RETURN @RET;

END