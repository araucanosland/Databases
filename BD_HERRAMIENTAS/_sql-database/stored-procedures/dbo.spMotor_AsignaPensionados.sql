IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_AsignaPensionados]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_AsignaPensionados]
GO
CREATE PROCEDURE [dbo].[spMotor_AsignaPensionados]
(
	@TOKEN VARCHAR(500),
	@RUT_EJECUTIVO VARCHAR(20),
	@ID_PENSIONADO INT
)
AS
BEGIN
DECLARE @COD_OFICINA INT =  security.fnSca_ObtenerOficinaByToken(@TOKEN)

UPDATE dbo.TabMotor_asignacion_Pensionados
SET RUTEJECUTIVO = @RUT_EJECUTIVO
WHERE CODOFICINA = @COD_OFICINA
AND id_Asign = @ID_PENSIONADO

END