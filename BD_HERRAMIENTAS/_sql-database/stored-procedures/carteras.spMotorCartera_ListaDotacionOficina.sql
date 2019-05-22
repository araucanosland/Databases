IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_ListaDotacionOficina]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_ListaDotacionOficina]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_ListaDotacionOficina]
@Token varchar(50)
AS 
BEGIN
	DECLARE @PeriodoActual INT = dbo.fnMotor_ObtenerPeriodoActual()
	DECLARE @OFICINA VARCHAR(20) = security.fnSca_ObtenerOficinaByToken(@Token)
	
	SELECT Rut, Nombre, Cargo FROM dbo.TabMotor_Dotacion
	where Cod_Sucursal = @OFICINA and Periodo = @PeriodoActual
END