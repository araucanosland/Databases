IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_LicenciaRecepcion_Guardar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_LicenciaRecepcion_Guardar]
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[spMotor_LicenciaRecepcion_Guardar]
(
	@Empresa_Rut				varchar(50),
	@Fecha_recepcion		datetime,
	@LM_Recibida				int,
	@LM_Digitada				int,
	@LM_NoDigitada			int,
	@LM_NoRecepcionada  int,
	@LM_Recepcionada 		int,
	@Token							VARCHAR(50),
	@CodOficinaEhec			int
)
AS
BEGIN


	DECLARE @RutEjec VARCHAR(20) = security.fnSca_ObtenerRutByToken(@Token)
	DECLARE @existe int = 0


select @existe = count(*) 
from [dbo].[TabMotor_Licencia_Recepcion]
where RutEmpresa = @Empresa_Rut
and CONVERT(DATE,FechaRecepcionLicencia) = CONVERT(DATE,@Fecha_recepcion)
and CodOficinaEjec=@CodOficinaEhec
and RutEjec=@RutEjec

IF @existe > 0 
BEGIN

		UPDATE [dbo].[TabMotor_Licencia_Recepcion]
		SET Num_LMRecibida = @LM_Recibida, 
				Num_LMDigitada=@LM_Digitada, 
				Num_LMNoDigitada=@LM_NoDigitada, 
				Num_LMNoRecepcion=@LM_NoRecepcionada,
				FechaActualizacion=GETDATE(),
				Num_LMRecepcionada=@LM_Recepcionada
		where RutEmpresa = @Empresa_Rut
		and CONVERT(DATE,FechaRecepcionLicencia) = CONVERT(DATE,@Fecha_recepcion)
		and CodOficinaEjec=@CodOficinaEhec 
		and RutEjec=@RutEjec


END
ELSE
BEGIN

		INSERT INTO [dbo].[TabMotor_Licencia_Recepcion]
           ([RutEmpresa]
           ,[FechaRecepcionLicencia]
           ,[Num_LMRecibida]
           ,[Num_LMDigitada]
           ,[Num_LMNoDigitada]
           ,[Num_LMNoRecepcion]
           ,[RutEjec]
           ,[CodOficinaEjec]
           ,[FechaActualizacion]
					 ,[Num_LMRecepcionada]
		)
		VALUES
		(
		 @Empresa_Rut		
		,CONVERT(DATE,@Fecha_recepcion)	
		,@LM_Recibida		
		,@LM_Digitada		
		,@LM_NoDigitada		
		,@LM_NoRecepcionada 
		,@RutEjec		
		,@CodOficinaEhec		
		,GETDATE()
		,@LM_Recepcionada
		)
END

END