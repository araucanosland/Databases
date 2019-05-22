IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[SPMotor_UpdateFlagInstalacion]') AND type = 'P')
DROP PROCEDURE [dbo].[SPMotor_UpdateFlagInstalacion]
GO
CREATE PROCEDURE [dbo].[SPMotor_UpdateFlagInstalacion](
@TOKEN varchar(50)
)
AS
BEGIN
	DECLARE @RUT VARCHAR(20) = BD_HERRAMIENTAS.SECURITY.FNSCA_OBTENERRUTBYTOKEN(@TOKEN)
	UPDATE security.TabSca_Usuario
	SET usr_instalacion = 0
	WHERE usr_rut = @RUT
END