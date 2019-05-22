IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Actualiza_DetalleEntrevista]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Actualiza_DetalleEntrevista]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Actualiza_DetalleEntrevista]
@TOKEN VARCHAR(250)
,@ID_ENTREVISTA_DETALLE INT 
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

INSERT INTO [CARTERAS].[TabCart_DetalleEntrevista](IdEntrevista
														,Tema
														,SubTema
														,Semaforo
														,Alerta
														,Compromiso
														,FechaResolucion
														,Comentarios
														,RutEjeIngreso
														,FechaIngreso
														,FlagActualizacion
														,IdDetalleOrigen)
												SELECT	IdEntrevista
														,Tema
														,SubTema
														,Semaforo
														,Alerta
														,Compromiso
														,FechaResolucion
														,Comentarios
														,RutEjeIngreso
														,SYSDATETIME()
														,1
														,@ID_ENTREVISTA_DETALLE 	
				FROM [CARTERAS].[TabCart_DetalleEntrevista]
				WHERE IdDetalleEntrevista = @ID_ENTREVISTA_DETALLE	

	UPDATE [CARTERAS].[TabCart_DetalleEntrevista]
				SET Tema = @TEMA 
					,SubTema = @SUBTEMA 
					,Semaforo = @SEMAFORO
					,Compromiso = @COMPROMISO
					,FechaResolucion = @FECHA_RESOLUCION
					,Alerta = @ALERTA
					,Comentarios = @COMENTARIOS  
				WHERE IdDetalleEntrevista = @ID_ENTREVISTA_DETALLE	
					
END