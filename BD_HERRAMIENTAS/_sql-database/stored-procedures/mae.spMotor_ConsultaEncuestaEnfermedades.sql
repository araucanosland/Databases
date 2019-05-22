IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[spMotor_ConsultaEncuestaEnfermedades]') AND type = 'P')
DROP PROCEDURE [mae].[spMotor_ConsultaEncuestaEnfermedades]
GO
CREATE PROCEDURE [mae].[spMotor_ConsultaEncuestaEnfermedades]
@RUT_AFILIADO VARCHAR(15)
AS 
BEGIN
	SELECT * FROM [BD_HERRAMIENTAS].[dbo].[TabEncuesta_01_PatologiaMedicamento]
	WHERE RUT_AFILIADO = @RUT_AFILIADO
END