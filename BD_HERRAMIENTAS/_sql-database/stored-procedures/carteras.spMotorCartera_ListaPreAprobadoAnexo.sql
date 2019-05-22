IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_ListaPreAprobadoAnexo]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_ListaPreAprobadoAnexo]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_ListaPreAprobadoAnexo] --1495,'69180100-4'
@ID_ANEXO INT,
@RUT_EMPRESA varchar(20)
AS
BEGIN
DECLARE @ANX_OBTENIDO INT = 0
DECLARE @PERIODO INT = dbo.fnMotor_ObtenerPeriodoActual()

SELECT @ANX_OBTENIDO = COUNT(IdAnexo) FROM BD_HERRAMIENTAS.carteras.TabCart_AfiliadosAnexo WHERE IdAnexo = @ID_ANEXO

IF @ANX_OBTENIDO <> 0 
	BEGIN 
		select * from TabMotor_Asignacion a
		INNER JOIN BD_HERRAMIENTAS.carteras.TabCart_AfiliadosAnexo b
		on CONVERT(VARCHAR, a.Afiliado_Rut) + '-' + a.Afiliado_Dv = b.RutAfiliado 
		where b.IdAnexo = @ID_ANEXO 
		--AND CONVERT(VARCHAR, a.Empresa_Rut) + '-' + a.Empresa_Dv = @RUT_EMPRESA 
		AND a.Periodo = @PERIODO and a.TipoAsignacion in (1,5)
		order by Afiliado_Rut
	END
	
	ELSE
	
	BEGIN
		select * from TabMotor_Asignacion 
		where Periodo = @PERIODO
		and TipoAsignacion in(1,5) 
		and Empresa_Rut +'-'+Empresa_Dv = @RUT_EMPRESA
	END
END