IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[SPMotor_ActualizaContrasena]') AND type = 'P')
DROP PROCEDURE [security].[SPMotor_ActualizaContrasena]
GO
CREATE procedure [security].[SPMotor_ActualizaContrasena]
@Token AS varchar(40),
@pass varchar(300)
as 
begin 
declare @Rut varchar(20) = BD_HERRAMIENTAS.security.fnSca_ObtenerRutByToken(@Token)

update security.TabSca_Usuario 
set usr_clave = (select CONVERT(VARCHAR(32), HashBytes('MD5', @pass), 2)), usr_estado_clave = 0
where usr_rut = @Rut
end