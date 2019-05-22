IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_NotificacionAsignacion_Listar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_NotificacionAsignacion_Listar]
GO
CREATE PROCEDURE [dbo].[spMotor_NotificacionAsignacion_Listar]
(
	@AfiliadoRut varchar(20)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 16-05-2017 16:53:24
-- Tabla Principal        : TabMotor_Notificacion_Asignacion
-- Descripcion            : Lista todos los registros de la tabla TabMotor_Notificacion_Asignacion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		*
	FROM
		TabMotor_Notificacion_Asignacion
	WHERE
		AfiliadoRut = @AfiliadoRut

END