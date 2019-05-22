IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Ausencia_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Ausencia_ObtenerPorID]
GO


CREATE PROCEDURE [dbo].[spMotor_Ausencia_ObtenerPorID]
(
	@aus_id int
)
AS
-- =============================================
-- Autor                  : Carlos Pradenas
-- Fecha de Creacion      : 28-06-2017 00:00:55
-- Tabla Principal        : TabMotor_Ausencia
-- Descripcion            : Recupera un registro la TabMotor_Ausencia dado un aus_id
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		aus_id,
		ejec_rut,
		aus_fecha_inicio,
		aus_fecha_fin,
		tipo_ausencia_id,
		aus_cantidad_dias,
		aus_comentarios,
		aus_marca_ausencia
	FROM
		TabMotor_Ausencia
	WHERE
		aus_id = @aus_id

END