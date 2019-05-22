IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_LicenciaEnvioCompin_Guardar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_LicenciaEnvioCompin_Guardar]
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[spMotor_LicenciaEnvioCompin_Guardar]
(
	@Fecha_enviolicencia	datetime,
	@Token				VARCHAR(50),
	@CodOficinaEjec		int,
	@num_LMEnvio int

)
AS
BEGIN


	DECLARE @RutEjec VARCHAR(20) = security.fnSca_ObtenerRutByToken(@Token)

DECLARE @Existe INT = 0

		SELECT @Existe = count(*) 
		from [dbo].[TabMotor_Licencia_Envio_Compin]
		where CONVERT(DATE,FechaEnvioLicencia) = CONVERT(DATE,@Fecha_enviolicencia)
		and CodOficinaEjec = @CodOficinaEjec


	IF @Existe > 0 
	BEGIN

			update [dbo].[TabMotor_Licencia_Envio_Compin]
			set RutEjec = @RutEjec, FechaActualizacion = GETDATE(), num_lm_envio = @num_LMEnvio
			where CONVERT(DATE,FechaEnvioLicencia) = CONVERT(DATE,@Fecha_enviolicencia)
			and CodOficinaEjec = @CodOficinaEjec

	END
ELSE
BEGIN
INSERT INTO [dbo].[TabMotor_Licencia_Envio_Compin]
						 (   [FechaEnvioLicencia]
					,[RutEjec]
					,[CodOficinaEjec]
					,[FechaActualizacion]
					,[num_lm_envio])
			VALUES
			(
			@Fecha_enviolicencia
			,@RutEjec		
			,@CodOficinaEjec		
			,GETDATE()
			,@num_LMEnvio
			)
END

END