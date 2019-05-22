IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Lista_Comuna_Pensionados]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Lista_Comuna_Pensionados]
GO
CREATE PROCEDURE [dbo].[spMotor_Lista_Comuna_Pensionados] 
AS
BEGIN
	select distinct COMUNA from dbo.TabMotor_asignacion_Pensionados
END