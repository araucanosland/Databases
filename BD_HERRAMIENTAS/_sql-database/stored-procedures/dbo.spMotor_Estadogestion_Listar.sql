IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Estadogestion_Listar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Estadogestion_Listar]
GO
CREATE PROCEDURE [dbo].[spMotor_Estadogestion_Listar]
AS
-- =============================================
-- Autor                  : Carlos Pradenas
-- Fecha de Creacion      : 12-04-2017 02:13:18
-- Tabla Principal        : TabMotor_EstadoGestion
-- Descripcion            : Lista todos los registros de la tabla TabMotor_EstadoGestion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		eges_id,
		eges_nombre,
		ejes_id_padre,
		ejes_terminal,
		ejes_tipo_campagna
	FROM
		TabMotor_EstadoGestion WITH (NOLOCK)
END