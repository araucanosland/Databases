IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Noticia_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Noticia_ObtenerPorID]
GO

CREATE PROCEDURE [dbo].[spMotor_Noticia_ObtenerPorID]
(
	@noti_id int
)
AS
-- =============================================
-- Autor                  : Charly
-- Fecha de Creacion      : 12-06-2017 10:20:28
-- Tabla Principal        : TabMotor_Noticia
-- Descripcion            : Recupera un registro la TabMotor_Noticia dado un noti_id
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
	WHERE
		noti_id = @noti_id

END