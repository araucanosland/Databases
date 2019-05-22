IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Resultadogestion_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Resultadogestion_ObtenerPorID]
GO
CREATE PROCEDURE [empresas].[spEmp_Resultadogestion_ObtenerPorID]
(
	@resg_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:55:30
-- Tabla Principal        : TabEmp_ResultadoGestion
-- Descripcion            : Recupera un registro la TabEmp_ResultadoGestion dado un resg_id
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		resg_id,
		resg_tipo,
		resg_comentarios,
		resg_fecha,
		fidelizacion_id
	FROM
		TabEmp_ResultadoGestion
	WHERE
		resg_id = @resg_id

END