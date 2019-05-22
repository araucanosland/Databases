IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Lista_Estado_Gestion]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Lista_Estado_Gestion]
GO
CREATE PROCEDURE [dbo].[spMotor_Lista_Estado_Gestion]
AS
BEGIN
	SELECT eges_id
		   ,ejes_id_padre
		   ,eges_nombre
		   ,ejes_terminal
		   ,ejes_tipo_campagna	
	FROM [dbo].[TabMotor_EstadoGestionPensionados]
END