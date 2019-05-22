IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Guarda_DetalleEntrevista]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Guarda_DetalleEntrevista]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Guarda_DetalleEntrevista]
@TOKEN VARCHAR(250)
,@ID_ENTREVISTA VARCHAR(15)
,@TEMA VARCHAR(100)
,@SUBTEMA VARCHAR(200)
,@SEMAFORO VARCHAR(200)
,@ALERTA VARCHAR(200)
,@FECHA_RESOLUCION VARCHAR(200)
,@COMENTARIOS VARCHAR(MAX)
,@COMPROMISO INT
AS
BEGIN 
DECLARE @RUT_EJECUTIVO_INGRESO VARCHAR(15) = CONVERT(VARCHAR, security.fnSca_ObtenerRutByToken (@TOKEN))

	INSERT INTO [CARTERAS].[TabCart_DetalleEntrevista]
	VALUES (@ID_ENTREVISTA
			,@TEMA
			,@SUBTEMA
			,@SEMAFORO
			,@ALERTA
			,@COMPROMISO
			,CONVERT (datetime, @FECHA_RESOLUCION, 103) 
			,@COMENTARIOS
			,@RUT_EJECUTIVO_INGRESO
			,SYSDATETIME()
			,0
			,0)	
	DECLARE @ID_DETALLE INT = (SELECT TOP 1 IdDetalleEntrevista FROM [CARTERAS].[TabCart_DetalleEntrevista]
	WHERE IdEntrevista = @ID_ENTREVISTA
	ORDER BY FechaIngreso DESC)
	UPDATE [CARTERAS].[TabCart_DetalleEntrevista]
		SET IdDetalleOrigen = @ID_DETALLE
	WHERE IdDetalleEntrevista = @ID_DETALLE					
END