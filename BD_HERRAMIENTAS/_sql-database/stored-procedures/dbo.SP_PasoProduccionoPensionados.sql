IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[SP_PasoProduccionoPensionados]') AND type = 'P')
DROP PROCEDURE [dbo].[SP_PasoProduccionoPensionados]
GO

--Exec [BD_HERRAMIENTAS].DBO.[SP_PasoProduccionoPensionados]
CREATE Proc [dbo].[SP_PasoProduccionoPensionados]
as
 
Declare @perPensionados varchar(6)  = ( Select MAX(PERCAMPAÑA) from [serv-55].bd_motor.Asign.TabMotor_Asignacion_PensionadosCamapaña)
SELECT @perPensionados
 
 
 
 --------------------------------------#Pensionados
		--Declare @maxId numeric = (Select MAX([id_Asign]) FROM [SERV-55].BD_Herramientas.dbo.TabMotor_Asignacion_PensionadosCamapaña )


		--SELECT *
		--INTO BD_HERRAMIENTAS.dbo.TabMotor_asignacion_Pensionados
		--FROM [SERV-55].bd_motor.Asign.TabMotor_Asignacion_PensionadosCamapaña

		delete from dbo.TabMotor_asignacion_Pensionados where PERCAMPAÑA = @perPensionados

		INSERT Into dbo.TabMotor_asignacion_Pensionados
		SELECT *
		FROM [serv-55].bd_motor.Asign.TabMotor_Asignacion_PensionadosCamapaña
		WHERE PERCAMPAÑA= @perPensionados
 
------------------------------------------------------
--------------------------------------#Confirmacion Carga

		Declare 
		 @DEST	varchar(1000)='mvegaa@laaraucana.cl; mmonsalvem@laaraucana.cl; '
		,@pensio	numeric= (Select Count(1) From BD_Herramientas.dbo.TabMotor_asignacion_Pensionados Where PERCAMPAÑA=@perPensionados)

		-----------Envio Mail 
				
					Declare 
					  @destin	varchar(5000) = @DEST
					 ,@copias	varchar(5000) = ''
					 ,@ocultos	varchar(5000) = ''
					 ,@asunto	varchar(100)  = 'Paso a Produccion Campaña Pensionados'
					 ,@cuerpo	varchar(max)  = 'Total Registros: '+Convert(varchar,@pensio) 

					EXEC msdb.dbo.sp_send_dbmail 
					 @profile_name				='Motor'
					,@recipients				= @destin
					,@importance				= 'High'
					,@subject					= @asunto
					,@body						= @cuerpo
					,@body_format				= 'HTML' ;