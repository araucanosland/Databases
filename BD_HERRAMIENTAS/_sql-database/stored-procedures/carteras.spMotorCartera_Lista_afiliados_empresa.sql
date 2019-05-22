IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_afiliados_empresa]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_afiliados_empresa]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Lista_afiliados_empresa]--'04882616-4'
@RUT_EMPRESA VARCHAR(15)
AS
BEGIN 

	SELECT convert(varchar, RutAfiliado) + '-' + DvAfiliado as RutAfiliado, Nombres + ' ' + Apellidos as NombreAfiliado
	FROM mae.Afiliados
	where rutempresa=  CAST(LEFT(@RUT_EMPRESA, 8)AS INT)  
	--and Periodo = dbo.fnMotor_ObtenerPeriodoActual()
	and RolSegmentoAfiliado <> 'Pensionado'

END