IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_LicenciaEnvioCompin_Obtener]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_LicenciaEnvioCompin_Obtener]
GO
CREATE PROCEDURE [dbo].[spMotor_LicenciaEnvioCompin_Obtener]
(
	@Fecha_enviolicencia	datetime
)
AS
BEGIN


	SELECT *
	FROM [dbo].[TabMotor_Licencia_Envio_Compin]
	WHERE CONVERT(DATE,[FechaEnvioLicencia])=CONVERT(DATE,@Fecha_enviolicencia)


END