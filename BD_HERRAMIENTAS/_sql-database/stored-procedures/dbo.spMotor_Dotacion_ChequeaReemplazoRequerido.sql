IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Dotacion_ChequeaReemplazoRequerido]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Dotacion_ChequeaReemplazoRequerido]
GO
CREATE PROCEDURE [dbo].[spMotor_Dotacion_ChequeaReemplazoRequerido]
  @EjecutivoRut AS varchar(20)
	
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'
		SELECT COUNT(*) Existe	
		FROM dbo.TabMotor_MarcaReemplazo
		WHERE EjecutivoRut = @EjecutivoRut
		


		

END