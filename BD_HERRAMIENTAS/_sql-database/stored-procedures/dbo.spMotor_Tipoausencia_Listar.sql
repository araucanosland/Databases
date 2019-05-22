IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Tipoausencia_Listar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Tipoausencia_Listar]
GO


CREATE PROCEDURE [dbo].[spMotor_Tipoausencia_Listar]
AS
-- =============================================
-- Autor                  : Carlos Pradenas
-- Fecha de Creacion      : 27-06-2017 23:56:50
-- Tabla Principal        : TabMotor_TipoAusencia
-- Descripcion            : Lista todos los registros de la tabla TabMotor_TipoAusencia
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
		taus_es_rango_fechas,
		taus_es_dias_corridos

	FROM
		TabMotor_TipoAusencia
	ORDER BY taus_nombre ASC
END