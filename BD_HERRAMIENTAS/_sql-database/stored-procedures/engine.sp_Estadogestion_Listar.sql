IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Estadogestion_Listar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Estadogestion_Listar]
GO
CREATE PROCEDURE [engine].[sp_Estadogestion_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:40:08
-- Tabla Principal        : EstadoGestion
-- Descripcion            : Lista todos los registros de la tabla EstadoGestion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		CodEstado,
		Nombre,
		CodEstPadre,
		EsTerminal,
		CodCamp
	FROM
		EstadoGestion
END