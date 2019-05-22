IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Lista_ultima_Contato]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Lista_ultima_Contato]
GO
CREATE PROCEDURE [dbo].[spMotor_Lista_ultima_Contato]-- 24742, 135
	@ID INT,
	@COD_OFICINA INT
AS
BEGIN 
	SELECT TOP 1 CON.con_contacto
			  ,CON.con_forma_contacto
			  ,CON.con_no_contacto_fono
			  ,CON.con_no_contacto_domicilo
			  ,CON.con_no_observacion_contacto
			  ,Case when EST.eges_nombre is null then '' else EST.eges_nombre end nomContatoSi
			  ,Case when EST2.eges_nombre is null then '' else EST2.eges_nombre end nomConFono
			  ,Case when EST3.eges_nombre is null then '' else EST3.eges_nombre end nomConDom
	FROM [dbo].[TabMotor_ContactoPensionados] CON
	
	LEFT JOIN [dbo].[TabMotor_EstadoGestionPensionados] EST
	ON CON.con_forma_contacto = EST.eges_id 
	
	LEFT JOIN [dbo].[TabMotor_EstadoGestionPensionados] EST2
	ON CON.con_no_contacto_fono = EST2.eges_id 
	
	LEFT JOIN [dbo].[TabMotor_EstadoGestionPensionados] EST3
	ON CON.con_no_contacto_domicilo = EST3.eges_id
	
	WHERE CON.con_contacto_uid = @ID AND CON.con_oficina = @COD_OFICINA
	ORDER BY con_fecha_accion_contacto DESC
END