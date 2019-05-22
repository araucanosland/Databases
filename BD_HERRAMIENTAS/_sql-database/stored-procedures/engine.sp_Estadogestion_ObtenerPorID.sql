IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Estadogestion_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Estadogestion_ObtenerPorID]
GO
CREATE PROCEDURE [engine].[sp_Estadogestion_ObtenerPorID]
(
	@CodEstado int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:40:04
-- Tabla Principal        : EstadoGestion
-- Descripcion            : Recupera un registro la EstadoGestion dado un CodEstado
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
	WHERE
		CodEstado = @CodEstado

END