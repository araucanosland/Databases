IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Guarda_Gestion_pensionado]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Guarda_Gestion_pensionado]
GO
CREATE PROCEDURE [dbo].[spMotor_Guarda_Gestion_pensionado] 
	@ges_bcam_uid INT,
	@ges_fecha_compromete DATETIME =  NULL,
	@ges_estado_gst VARCHAR(255),
	@ges_sub_estado_gst VARCHAR(255),
	@ges_descripcion_gst VARCHAR(500) = NULL,
	@ges_ejecutivo_rut VARCHAR(20),
	@ges_oficina VARCHAR(20),
	@estado_gestion INT
 AS
 BEGIN
	 INSERT INTO [dbo].[TabMotor_GestionPensionados]
	 VALUES(@ges_bcam_uid
			,@ges_estado_gst
			,@ges_sub_estado_gst
			,@ges_fecha_compromete
			,@ges_descripcion_gst
			,GETDATE()
			,@ges_ejecutivo_rut
			,@ges_oficina)
	  UPDATE [dbo].[TabMotor_asignacion_Pensionados]
	  SET ESTADO_GESTION = @estado_gestion
	  WHERE id_Asign = 	@ges_bcam_uid 
END