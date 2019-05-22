IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Lista_ultima_Gestion_Contato]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Lista_ultima_Gestion_Contato]
GO
CREATE PROCEDURE [dbo].[spMotor_Lista_ultima_Gestion_Contato]--  24742, 135
	@ID INT,
	@COD_OFICINA INT
AS
BEGIN
	SELECT  TOP 1 GES.ges_estado_gst
			,GES.ges_sub_estado_gst
			,EST.eges_nombre
			,GES.ges_fecha_compromete
			,GES.ges_descripcion_gst
			,GES.ges_fecha_accion
			
	FROM [dbo].[TabMotor_GestionPensionados] GES
	LEFT JOIN [dbo].[TabMotor_EstadoGestionPensionados] EST
	ON GES.ges_sub_estado_gst = EST.eges_id
	WHERE GES.ges_bcam_uid =  @ID AND GES.ges_oficina = @COD_OFICINA
	ORDER BY GES.ges_fecha_accion DESC
END