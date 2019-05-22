IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Actualiza_GestionMantencion]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Actualiza_GestionMantencion]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Actualiza_GestionMantencion]
@TOKEN VARCHAR(250)
,@ID_GEST_MANTENCION INT
,@RUT_EMPRESA VARCHAR(15)
,@TEMA VARCHAR(15)
,@SUBTEMA VARCHAR(200)
,@RUT_AFILIADO VARCHAR(MAX)
,@COMENTARIOS VARCHAR(MAX)
AS
BEGIN 

DECLARE @RUT_EJECUTIVO_INGRESO VARCHAR(15) = CONVERT(VARCHAR, security.fnSca_ObtenerRutByToken (@TOKEN))
INSERT INTO [CARTERAS].[TabCart_DetalleGestionMantencion](IdCabGesMantencion
														,RutEmpresa
														,Tema
														,SubTema
														,RutAfiliado
														,Comentarios
														,RutEjeIngreso
														,FechaIngreso
														,Alerta
														,FlagActualizacion
														,IdDetalleOrigen)
												SELECT	IdCabGesMantencion
														,RutEmpresa
														,Tema
														,SubTema
														,RutAfiliado
														,Comentarios
														,RutEjeIngreso
														,SYSDATETIME()
														,Alerta
														,1
														,@ID_GEST_MANTENCION 	
				FROM [CARTERAS].[TabCart_DetalleGestionMantencion]
				WHERE IdGesMantencion = @ID_GEST_MANTENCION	
				
				UPDATE [CARTERAS].[TabCart_DetalleGestionMantencion]
				SET Tema = @TEMA 
					,SubTema = @SUBTEMA 
					,RutAfiliado = @RUT_AFILIADO
					,Comentarios = @COMENTARIOS  
				WHERE IdGesMantencion = @ID_GEST_MANTENCION	
		
END