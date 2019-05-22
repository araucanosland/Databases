IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_buscaPensionados]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_buscaPensionados]
GO
 CREATE PROCEDURE [dbo].[spMotor_buscaPensionados] 
(
	@ID_PENSIONADO INT
)
AS
BEGIN

 SELECT NOMBREPEN,
		FONOPARTICULAR,
		FONOCELULAR,
		CALLE + ' ' + CONVERT(varchar(300),  NUMERO ) as DIRECCION,
		COMUNA,
		EMAIL,
		NUMERO
FROM dbo.TabMotor_asignacion_Pensionados
WHERE id_Asign = @ID_PENSIONADO
 
 END