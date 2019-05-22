IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_NotificacionAsignacion_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_NotificacionAsignacion_ObtenerPorID]
GO
CREATE PROCEDURE [dbo].[spMotor_NotificacionAsignacion_ObtenerPorID]
(
	@AfiliadoRut varchar(20),
	@Tipo varchar(50)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 16-05-2017 16:52:55
-- Tabla Principal        : TabMotor_Notificacion_Asignacion
-- Descripcion            : Recupera un registro la TabMotor_Notificacion_Asignacion dado un AfiliadoRut
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
	AND 
		Tipo = @Tipo
END