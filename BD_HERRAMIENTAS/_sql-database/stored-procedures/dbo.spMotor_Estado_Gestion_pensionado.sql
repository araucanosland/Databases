IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Estado_Gestion_pensionado]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Estado_Gestion_pensionado]
GO
 CREATE PROCEDURE [dbo].[spMotor_Estado_Gestion_pensionado] 
	@PADRE INT
 AS
 BEGIN
	SELECT eges_id
		  ,eges_nombre
		  ,ejes_id_padre
		  ,ejes_terminal
		  ,ejes_tipo_campagna
	FROM [dbo].[TabMotor_EstadoGestionPensionados]
	WHERE ejes_id_padre = @PADRE
 END