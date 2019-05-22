IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_LicenciaRecepcion_Obtener]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_LicenciaRecepcion_Obtener]
GO
CREATE PROCEDURE [dbo].[spMotor_LicenciaRecepcion_Obtener]
(
	@Empresa_Rut		varchar(50),
	@Fecha_recepcion	datetime
)
AS
BEGIN


	SELECT *
	FROM TabMotor_Licencia_Recepcion
	WHERE [RutEmpresa] = @Empresa_Rut
	AND [FechaRecepcionLicencia] = CONVERT(DATE,@Fecha_recepcion)


END