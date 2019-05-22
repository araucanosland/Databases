IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Tipoausencia_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Tipoausencia_ObtenerPorID]
GO


CREATE PROCEDURE [dbo].[spMotor_Tipoausencia_ObtenerPorID]
(
	@taus_id int
)
AS
-- =============================================
-- Autor                  : Carlos Pradenas
-- Fecha de Creacion      : 27-06-2017 23:56:08
-- Tabla Principal        : TabMotor_TipoAusencia
-- Descripcion            : Recupera un registro la TabMotor_TipoAusencia dado un taus_id
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		taus_id,
		taus_nombre,
		taus_clase_color,
		taus_es_rango_fechas
	FROM
		TabMotor_TipoAusencia
	WHERE
		taus_id = @taus_id

END