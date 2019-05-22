IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Actualiza_Contacto_pensionado]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Actualiza_Contacto_pensionado]
GO
 CREATE PROCEDURE [dbo].[spMotor_Actualiza_Contacto_pensionado] 
	@ID_ASIGN INT,
	@FONOPARTICULAR INT,
	@FONOCELULAR INT,
	@CALLE VARCHAR(500), 
	@NUMERO INT,
	@COMUNA VARCHAR(300),
	@EMAIL VARCHAR(500)
 AS
 BEGIN
 
	 UPDATE dbo.TabMotor_asignacion_Pensionados
	 SET FONOPARTICULAR = @FONOPARTICULAR
		,FONOCELULAR = @FONOCELULAR
		,CALLE = @CALLE
		,NUMERO = @NUMERO
		,COMUNA = @COMUNA
		,EMAIL = @EMAIL
		,flagActDir	= 1
	 WHERE id_Asign = @ID_ASIGN
	
 END