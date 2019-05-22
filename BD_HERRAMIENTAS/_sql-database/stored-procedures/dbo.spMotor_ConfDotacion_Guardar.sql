IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ConfDotacion_Guardar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ConfDotacion_Guardar]
GO
CREATE PROCEDURE [dbo].[spMotor_ConfDotacion_Guardar]
(
	@Token VARCHAR(50)
)
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @FECHA_HORA_HOY DATETIME = GETDATE()
	DECLARE @FECHA_HOY DATE = CONVERT(DATE,@FECHA_HORA_HOY)
	DECLARE @EXISTE_REG INT = 0
	DECLARE @RUT_EJECUTIVO VARCHAR(20) = security.fnSca_ObtenerRutByToken(@Token)
	DECLARE @OFICINA VARCHAR(20) = security.fnSca_ObtenerOficinaByToken(@Token)
	DECLARE @RET INT = 1

	
	SELECT @EXISTE_REG = COUNT(*)
	FROM dbo.TabMotor_ConfirmacionDotacion 
	WHERE EjecutivoRut = @RUT_EJECUTIVO
	AND CONVERT(DATE,Fecha) = @FECHA_HOY


	IF @EXISTE_REG > 0 
	BEGIN
			UPDATE dbo.TabMotor_ConfirmacionDotacion SET Fecha = @FECHA_HORA_HOY, CodOficina = @OFICINA
			WHERE EjecutivoRut = @RUT_EJECUTIVO 
			AND CONVERT(DATE,Fecha) = @FECHA_HOY 
			
			SET @RET = 2
	END	
	ELSE
	BEGIN	
			INSERT INTO dbo.TabMotor_ConfirmacionDotacion VALUES (@RUT_EJECUTIVO, @FECHA_HORA_HOY, @OFICINA)
	END


	SELECT @RET RTRN;

END