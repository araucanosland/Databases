IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ActualizaEjecutivo]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ActualizaEjecutivo]
GO
CREATE PROCEDURE [dbo].[spMotor_ActualizaEjecutivo](
	@Rut VARCHAR(30),
	@Cargo VARCHAR(200),
	@TipoContrato VARCHAR(2),
	@FechaInicio DATETIME,
	@FechaFinaliza DATETIME,
	@Sexo VARCHAR(1)
)
AS
BEGIN
	UPDATE dbo.TabMotor_Dotacion 
		SET Cargo =@Cargo, TipoContrato = @TipoContrato, FechaIngreso = CONVERT(DATE,@FechaInicio), FechaFinalizacion = CONVERT(DATE,@FechaFinaliza), Sexo =@Sexo
	WHERE Rut= @Rut
END