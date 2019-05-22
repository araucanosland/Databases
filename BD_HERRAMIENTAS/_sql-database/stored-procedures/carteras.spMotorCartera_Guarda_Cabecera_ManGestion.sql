IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Guarda_Cabecera_ManGestion]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Guarda_Cabecera_ManGestion]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Guarda_Cabecera_ManGestion]--'ecaca9cd-0d64-4d7f-8c2b-85d9393752a5', '61502000-1', '25/10/2018', 'Telefono', 'Comentarios de prueba --- Sergio Pizarro'
@TOKEN VARCHAR(250)
,@RUT_EMPRESA VARCHAR(15)
,@FECHA_INGRESO VARCHAR(200)
,@TIPO VARCHAR(200)
,@COMENTARIO VARCHAR(MAX)
,@ANEXO INT
AS
BEGIN 
DECLARE @RUT_EJECUTIVO_INGRESO VARCHAR(15) = CONVERT(VARCHAR, security.fnSca_ObtenerRutByToken (@TOKEN))
DECLARE @OFICINA_EJECUTIVO_INGRESO INT = CONVERT(INT, security.fnSca_ObtenerOficinaByToken(@Token))

	IF  @ANEXO = 0
	BEGIN
		select @ANEXO = IdEmpresaAnexo
		from carteras.TabCart_AnexoEmpresa
		where RutEmpresa = @RUT_EMPRESA and EsMatriz = 1
		and codOficina = @OFICINA_EJECUTIVO_INGRESO
	END


	INSERT INTO [carteras].[TabCart_CabeceraGestionMantencion]
	VALUES (@RUT_EMPRESA
			,@TIPO	
			,@COMENTARIO
			,@RUT_EJECUTIVO_INGRESO
			,CONVERT (datetime, @FECHA_INGRESO, 103)
			,@OFICINA_EJECUTIVO_INGRESO
			,@ANEXO) 		
			
	SELECT SCOPE_IDENTITY() IdCabGesMantencion
END