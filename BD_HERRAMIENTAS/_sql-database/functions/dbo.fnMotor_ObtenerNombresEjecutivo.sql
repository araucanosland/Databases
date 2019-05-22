IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[fnMotor_ObtenerNombresEjecutivo]') AND type = 'FN')
DROP FUNCTION [dbo].[fnMotor_ObtenerNombresEjecutivo]
GO
CREATE FUNCTION [dbo].[fnMotor_ObtenerNombresEjecutivo](@EjecRut varchar(20))
RETURNS VARCHAR(100)
AS
BEGIN

	DECLARE @Nombres VARCHAR(100)


	SELECT DISTINCT  @Nombres = Nombre
  FROM TabMotor_Dotacion
	WHERE Rut =  @EjecRut

	return @Nombres
END