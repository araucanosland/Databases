IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[SPMotor_Instalacion]') AND type = 'P')
DROP PROCEDURE [dbo].[SPMotor_Instalacion]
GO
CREATE PROCEDURE [dbo].[SPMotor_Instalacion](
@IdInstalacion int
)
AS
BEGIN

	
	SELECT A.Id_instal, A.Titulo,Glosa, A.Ruta, A.Tiempo 
	FROM TabMotor_Instalacion A
	WHERE a.Id_instal = @IdInstalacion
	
--	SELECT * FROM security.TabSca_Usuario
END