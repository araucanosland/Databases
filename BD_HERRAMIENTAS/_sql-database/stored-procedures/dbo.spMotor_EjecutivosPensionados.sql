IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_EjecutivosPensionados]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_EjecutivosPensionados]
GO
CREATE PROCEDURE [dbo].[spMotor_EjecutivosPensionados] --'c9e58a4d-001a-4422-ac90-5b4d8b66a36d'
(
	@TOKEN VARCHAR(500)
)
AS
BEGIN
	DECLARE @COD_OFICINA INT =  security.fnSca_ObtenerOficinaByToken(@TOKEN)
	DECLARE @PERIODO INT =  dbo.fnMotor_ObtenerPeriodoActual()

	SELECT Rut 
	,Case when Cargo = 'Agente' and CargoOriginal = 'Agente' then 'Sin Asignación' else Nombre end Nombre
	,Cod_Sucursal
	FROM BD_HERRAMIENTAS.dbo.TabMotor_Dotacion
	WHERE Cargo in ( 'Agente','Ejecutivo Pensionados','Ejecutivos Incorporación y Prospección Pensionados')
	AND Cod_Sucursal = @COD_OFICINA
	AND Periodo = @PERIODO 
	ORDER BY Nombre DESC
END