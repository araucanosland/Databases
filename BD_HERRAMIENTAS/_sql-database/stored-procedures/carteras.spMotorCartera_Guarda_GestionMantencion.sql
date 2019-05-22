IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Guarda_GestionMantencion]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Guarda_GestionMantencion]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Guarda_GestionMantencion]
@TOKEN VARCHAR(250)
,@RUT_EMPRESA VARCHAR(15)
,@TEMA VARCHAR(15)
,@SUBTEMA VARCHAR(200)
,@TIPO VARCHAR(200)
,@RUT_AFILIADO VARCHAR(MAX)
,@COMENTARIOS VARCHAR(MAX)
,@ALERTA INT
AS
BEGIN 
DECLARE @RUT_EJECUTIVO_INGRESO VARCHAR(15) = CONVERT(VARCHAR, security.fnSca_ObtenerRutByToken (@TOKEN))
--DECLARE @NOMBRE_AFILIADO VARCHAR(300) = (SELECT Nombres + ' ' + Apellidos FROM mae.Afiliados WHERE RutAfiliado = @RUT_AFILIADO)

	INSERT INTO [CARTERAS].[TabCart_GestionMantencion]
	VALUES ( @RUT_EMPRESA
			,@TEMA
			,@SUBTEMA
			,@TIPO
			,@RUT_AFILIADO
			,''
			,@COMENTARIOS
			,@RUT_EJECUTIVO_INGRESO
			,SYSDATETIME()
			,@ALERTA
			,0
			,0)
	DECLARE @ID_DETALLE_MAN INT = (SELECT TOP 1 IdGesMantencion FROM [CARTERAS].[TabCart_GestionMantencion]
	WHERE RutEmpresa = @RUT_EMPRESA
	ORDER BY FechaIngreso DESC)
	UPDATE [CARTERAS].[TabCart_GestionMantencion]
		SET IdDetalleOrigen = @ID_DETALLE_MAN
	WHERE IdGesMantencion = @ID_DETALLE_MAN	
	
	

			
		
END