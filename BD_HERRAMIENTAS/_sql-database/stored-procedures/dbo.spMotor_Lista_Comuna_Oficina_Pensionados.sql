IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Lista_Comuna_Oficina_Pensionados]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Lista_Comuna_Oficina_Pensionados]
GO
CREATE PROCEDURE [dbo].[spMotor_Lista_Comuna_Oficina_Pensionados]
@TOKEN VARCHAR(250)
AS
BEGIN
	DECLARE @COD_OFICINA INT =  security.fnSca_ObtenerOficinaByToken(@TOKEN)
	
	select distinct COMUNA from dbo.TabMotor_asignacion_Pensionados
	where CODOFICINA = @COD_OFICINA
END