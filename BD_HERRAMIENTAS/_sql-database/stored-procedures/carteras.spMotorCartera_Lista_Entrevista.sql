IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_Entrevista]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_Entrevista]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Lista_Entrevista] --'61502000-1'
@TOKEN VARCHAR(250)
,@RUT_EMPRESA VARCHAR(15)
,@COD_ANEXO INT
AS
BEGIN 
DECLARE @COD_ODFINA INT = security.fnSca_ObtenerOficinaByToken(@TOKEN)
DECLARE @RUT_EJECUTIVO VARCHAR(15) = CONVERT(VARCHAR, security.fnSca_ObtenerRutByToken (@TOKEN))
DECLARE @EL_ANEXO INT = @COD_ANEXO


	IF  @COD_ANEXO = 0
	BEGIN
		select @EL_ANEXO = IdEmpresaAnexo
		from carteras.TabCart_AnexoEmpresa
		where RutEmpresa = @RUT_EMPRESA and EsMatriz = 1
		and codOficina = @COD_ODFINA
	END


select
	A.IdEntrevista
	,A.RutEmpresa
	,A.FechaEntrevista
	,'Entrevista' Tipo
	,A.NombreContacto
	,A.Cargo
	,A.Estamento
	,A.Comentarios
	,A.RutEjeIngreso
	,A.FechaIngreso
	,B.Nombre NombreEjecutivo
	from [carteras].[TabCart_CabeceraEntrevista] A
	INNER JOIN dbo.TabMotor_Dotacion B 
	ON A.RutEjeIngreso = B.Rut and B.Periodo = dbo.fnMotor_ObtenerPeriodoActual()
	WHERE RUTEMPRESA = @RUT_EMPRESA  AND 
	a.CodigoAnexo = @EL_ANEXO AND B.Cod_Sucursal = @COD_ODFINA
	--AND a.RutEjeIngreso = @RUT_EJECUTIVO
END