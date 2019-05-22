IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_ListaPreAprobadoEmpresa]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_ListaPreAprobadoEmpresa]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_ListaPreAprobadoEmpresa]
@Token VARCHAR(50),
@RUT_EMPRESA varchar(20)
AS
BEGIN
      --DECLARE @RUT_EJECUTIVO VARCHAR(20) = security.fnSca_ObtenerRutByToken(@Token)
      DECLARE @PERIODO INT = dbo.fnMotor_ObtenerPeriodoActual()

      select * from TabMotor_Asignacion 
      where Periodo = @PERIODO
      --and Cuadrante =  1 
      and TipoAsignacion in(1,5) 
      and RIGHT('0'+Empresa_Rut,8)+'-'+Empresa_Dv = @RUT_EMPRESA
      --and Ejec_Asignacion = @RUT_EJECUTIVO

END