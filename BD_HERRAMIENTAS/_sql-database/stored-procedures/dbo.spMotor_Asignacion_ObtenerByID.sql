IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Asignacion_ObtenerByID]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Asignacion_ObtenerByID]
GO
CREATE PROCEDURE [dbo].[spMotor_Asignacion_ObtenerByID]
	@IdAsig int
AS
BEGIN
  
	select * 
	from TabMotor_Asignacion
	where id_Asign = @IdAsig

END