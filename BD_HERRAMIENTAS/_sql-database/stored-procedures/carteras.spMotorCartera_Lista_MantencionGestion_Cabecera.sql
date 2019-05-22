IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_MantencionGestion_Cabecera]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_MantencionGestion_Cabecera]
GO

CREATE PROCEDURE [carteras].[spMotorCartera_Lista_MantencionGestion_Cabecera]--'c580b573-4040-4b6e-b085-c2289e30e3d4','71146000-4', 45702
@TOKEN VARCHAR(250)
,@RUT_EMPRESA VARCHAR(100)
,@COD_ANEXO INT
AS
BEGIN 
DECLARE @COD_ODFINA INT = security.fnSca_ObtenerOficinaByToken(@TOKEN)
DECLARE @RUT_EJECUTIVO VARCHAR(15) = CONVERT(VARCHAR, security.fnSca_ObtenerRutByToken (@TOKEN))
DECLARE @PERIODO INT = dbo.fnMotor_ObtenerPeriodoActual()

DECLARE @EL_ANEXO INT = @COD_ANEXO


	IF  @COD_ANEXO = 0
	BEGIN
		select @EL_ANEXO = IdEmpresaAnexo
		from carteras.TabCart_AnexoEmpresa
		where RutEmpresa = @RUT_EMPRESA and EsMatriz = 1
		and codOficina = @COD_ODFINA
	END


SELECT  A.IdCabGesMantencion
	   ,A.RutEmpresa	
	   ,A.Tipo
	   ,A.Comentarios
	   ,A.RutEjeIngreso
	   ,A.FechaIngreso
	   ,B.Nombre NombreEjecutivo
FROM [carteras].[TabCart_CabeceraGestionMantencion] A
	LEFT JOIN dbo.TabMotor_Dotacion B 
	ON A.RutEjeIngreso = B.Rut and B.Periodo = @PERIODO
WHERE A.RutEmpresa = @RUT_EMPRESA AND B.Cod_Sucursal = @COD_ODFINA 
AND a.CodigoAnexo = @EL_ANEXO
--AND a.RutEjeIngreso = @RUT_EJECUTIVO

END