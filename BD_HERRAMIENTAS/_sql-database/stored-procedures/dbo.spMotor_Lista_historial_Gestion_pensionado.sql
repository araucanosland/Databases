IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Lista_historial_Gestion_pensionado]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Lista_historial_Gestion_pensionado]
GO
CREATE PROCEDURE [dbo].[spMotor_Lista_historial_Gestion_pensionado] --24742
	@ID_PENSIONADO INT
AS
BEGIN
	DECLARE @PERIODO INT = dbo.fnMotor_ObtenerPeriodoActual()
	SELECT a.ges_bcam_uid
		   ,a.ges_fecha_accion
		   ,a.ges_fecha_compromete
		   ,a.ges_descripcion_gst
		   ,b.eges_nombre as estado
		   ,c.eges_nombre as subEstado 
		   ,e.Nombre AS Ejecutivo
	FROM [dbo].[TabMotor_GestionPensionados] a
		LEFT JOIN [dbo].[TabMotor_EstadoGestionPensionados] b
		ON a.ges_estado_gst = b.eges_id 
		LEFT JOIN [dbo].[TabMotor_EstadoGestionPensionados] c
		ON a.ges_sub_estado_gst = c.eges_id
		LEFT JOIN [dbo].[TabMotor_Dotacion] e 
		ON a.ges_ejecutivo_rut = e.Rut and e.Periodo = @PERIODO
	where a.ges_bcam_uid = @ID_PENSIONADO
	order by a.ges_fecha_accion desc
	
END