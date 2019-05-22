IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[SPMotor_Estado_contrasena]') AND type = 'P')
DROP PROCEDURE [security].[SPMotor_Estado_contrasena]
GO
CREATE PROCEDURE [security].[SPMotor_Estado_contrasena]
--EXEC [security].[SPMotor_Estado_contraseña] '11820318-6'
@Token AS varchar(40)
AS
BEGIN
	declare @Rut varchar(20) = BD_HERRAMIENTAS.security.fnSca_ObtenerRutByToken(@Token)
	select usr_estado_clave from  security.TabSca_Usuario 
	where usr_rut = @Rut
END