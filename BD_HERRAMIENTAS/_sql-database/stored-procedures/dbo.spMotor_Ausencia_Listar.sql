IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Ausencia_Listar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Ausencia_Listar]
GO
CREATE PROCEDURE [dbo].[spMotor_Ausencia_Listar]
AS
-- =============================================
-- Autor                  : Carlos Pradenas
-- Fecha de Creacion      : 28-06-2017 00:01:03
-- Tabla Principal        : TabMotor_Ausencia
-- Descripcion            : Lista todos los registros de la tabla TabMotor_Ausencia
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
END