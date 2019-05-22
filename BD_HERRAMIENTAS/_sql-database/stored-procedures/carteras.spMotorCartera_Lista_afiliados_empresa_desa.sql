IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_afiliados_empresa_desa]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_afiliados_empresa_desa]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Lista_afiliados_empresa_desa] --'01920510-k'
@RUT_EMPRESA VARCHAR(15)
AS
BEGIN 

	SELECT convert(varchar, RutAfiliado) + '-' + DvAfiliado as RutAfiliado, Nombres + ' ' + Apellidos as NombreAfiliado
	FROM mae.Afiliados
	--where Periodo = dbo.fnMotor_ObtenerPeriodoActual()
	 where rutempresa=  CAST(LEFT(@RUT_EMPRESA, 8)AS INT) 

END