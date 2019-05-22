IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Atributo_Listar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Atributo_Listar]
GO
CREATE PROCEDURE [engine].[sp_Atributo_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:25:20
-- Tabla Principal        : Atributo
-- Descripcion            : Lista todos los registros de la tabla Atributo
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
		TipoDato
	FROM
		Atributo
END