IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[sp_Feriados_Listar]') AND type = 'P')
DROP PROCEDURE [dbo].[sp_Feriados_Listar]
GO
CREATE PROCEDURE [dbo].[sp_Feriados_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 28-08-2017 13:12:40
-- Tabla Principal        : TabMotor_Feriados
-- Descripcion            : Lista todos los registros de la tabla TabMotor_Feriados
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		Fecha,
		Descripcion
	FROM
		TabMotor_Feriados
END