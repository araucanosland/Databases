IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Resultadogestion_Listar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Resultadogestion_Listar]
GO
CREATE PROCEDURE [empresas].[spEmp_Resultadogestion_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:55:36
-- Tabla Principal        : TabEmp_ResultadoGestion
-- Descripcion            : Lista todos los registros de la tabla TabEmp_ResultadoGestion
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
END