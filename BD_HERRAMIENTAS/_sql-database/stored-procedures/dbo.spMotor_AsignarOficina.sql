IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_AsignarOficina]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_AsignarOficina]
GO
CREATE PROCEDURE [dbo].[spMotor_AsignarOficina]
(
	@Asignacion int,
	@Oficina int
)
AS
-- =============================================
-- Autor                  : Carlos Pradenas
-- Fecha de Creacion      : 11-04-2017 17:46:40
-- Tabla Principal        : TabMotor_Asignacion
-- Descripcion            : Guarda un registro en la tabla TabMotor_Asignacion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	
		UPDATE TabMotor_Asignacion SET 
			Oficina = @Oficina
		WHERE id_Asign = @Asignacion
	

		update dbo.TabMotor_LogDerivacion set oficina_derivacion = @Oficina
		where id_asignacion = @Asignacion

END