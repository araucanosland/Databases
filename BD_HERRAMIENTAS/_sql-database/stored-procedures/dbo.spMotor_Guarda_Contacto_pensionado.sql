IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Guarda_Contacto_pensionado]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Guarda_Contacto_pensionado]
GO
CREATE PROCEDURE [dbo].[spMotor_Guarda_Contacto_pensionado] 
	@con_contacto_uid INT,
	@con_contacto VARCHAR(5),
	@con_forma_contacto INT,
	@con_no_contacto_fono INT,
	@con_no_contacto_domicilo INT,
	@con_no_observacion_contacto VARCHAR(500) = NULL,
	@con_ejecutivo_rut VARCHAR(20),
	@con_oficina VARCHAR(20),
	@estado_gestion INT
 AS
 BEGIN
	 INSERT INTO [dbo].[TabMotor_ContactoPensionados]
	 VALUES(@con_contacto_uid
			,@con_contacto
			,@con_forma_contacto
			,@con_no_contacto_fono
			,@con_no_contacto_domicilo
			,@con_no_observacion_contacto
			,GETDATE()  
			,@con_ejecutivo_rut
			,@con_oficina)
	 UPDATE [dbo].[TabMotor_asignacion_Pensionados]
	 SET ESTADO_GESTION = @estado_gestion
	 WHERE id_Asign = 	@con_contacto_uid 
 	
END