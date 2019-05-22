IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Estado_Gestion_Contacto_pensionado]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Estado_Gestion_Contacto_pensionado]
GO
CREATE PROCEDURE [dbo].[spMotor_Estado_Gestion_Contacto_pensionado] 
 AS
 BEGIN
	SELECT eges_id
		  ,eges_nombre
		  ,ejes_id_padre
		  ,ejes_terminal
		  ,ejes_tipo_campagna
	FROM [dbo].[TabMotor_EstadoGestionPensionados]
	WHERE eges_id in (1,2,3)
 END