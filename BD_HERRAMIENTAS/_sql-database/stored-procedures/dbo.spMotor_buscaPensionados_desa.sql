IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_buscaPensionados_desa]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_buscaPensionados_desa]
GO
CREATE PROCEDURE [dbo].[spMotor_buscaPensionados_desa] 
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