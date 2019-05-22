IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Noticia_Listar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Noticia_Listar]
GO

CREATE PROCEDURE [dbo].[spMotor_Noticia_Listar]
AS
-- =============================================
-- Autor                  : Charly
-- Fecha de Creacion      : 12-06-2017 10:26:50
-- Tabla Principal        : TabMotor_Noticia
-- Descripcion            : Lista todos los registros de la tabla TabMotor_Noticia
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		noti_id,
		noti_titulo,
		noti_cuerpo,
		noti_cerrable,
		noti_fecha
	FROM
		TabMotor_Noticia
END