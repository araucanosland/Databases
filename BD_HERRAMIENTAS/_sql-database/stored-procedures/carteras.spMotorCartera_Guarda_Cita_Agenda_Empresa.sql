IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Guarda_Cita_Agenda_Empresa]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Guarda_Cita_Agenda_Empresa]
GO

CREATE PROCEDURE [carteras].[spMotorCartera_Guarda_Cita_Agenda_Empresa]
@TOKEN VARCHAR(300)
,@RUT_EMPRESA VARCHAR(15)
,@NOMBRE_EMPRESA VARCHAR(500)
,@GLOSA VARCHAR(500)
,@FECHA_INICO DATETIME
,@FECHA_FIN DATETIME
,@HORA_INICIO VARCHAR(20)
,@HORA_FIN VARCHAR(20)
,@FRECUENCIA VARCHAR(100)
,@DIAS VARCHAR(300)
,@TIPO_VISITA VARCHAR(200)
,@ID_ANEXO INT
,@DIA_SUCEDE INT
AS
BEGIN

	SET LANGUAGE Spanish
	DECLARE @CODOFICINA INT = CONVERT(INT, security.fnSca_ObtenerOficinaByToken(@TOKEN))
	DECLARE @RUT_EJECUTIVO VARCHAR(15) = CONVERT(VARCHAR, security.fnSca_ObtenerRutByToken(@TOKEN))
	DECLARE @ID_REGISTRO INT = ABS(CHECKSUM(NEWID()))
	DECLARE @FECHA DATETIME = @FECHA_INICO
	DECLARE @FECHA_FN DATETIME = @FECHA_FIN
	
	IF @FRECUENCIA = 'Diaria' 
	  BEGIN 
	  
	  IF @DIA_SUCEDE != 0 
		BEGIN 
			WHILE (@FECHA < DATEADD(MONTH, 12, GETDATE()))
				BEGIN
					SET @FECHA_INICO = (SELECT @FECHA WHERE DATENAME(WEEKDAY, @FECHA) IN ('Lunes','Martes','Miércoles','Jueves','Viernes'))
					SET @FECHA_FIN = (SELECT @FECHA_FN WHERE DATENAME(WEEKDAY, @FECHA_FN) IN ('Lunes','Martes','Miércoles','Jueves','Viernes'))
					IF @FECHA_INICO <> ''
					BEGIN
						INSERT INTO [BD_HERRAMIENTAS].[carteras].[TabCart_Agenda_Empresa]
						VALUES (@ID_REGISTRO
								,@RUT_EMPRESA
								,@NOMBRE_EMPRESA
								,@RUT_EJECUTIVO
								,@GLOSA
								,@FECHA_INICO
								,@FECHA_FIN
								,@HORA_INICIO
								,@HORA_FIN
								,@FRECUENCIA
								,''
								,@DIA_SUCEDE
								,@TIPO_VISITA
								,@CODOFICINA
								,@ID_ANEXO)
					END 
					SET @FECHA = DATEADD(DAY, @DIA_SUCEDE, @FECHA)
					SET @FECHA_FN = DATEADD(DAY, @DIA_SUCEDE, @FECHA_FN)
				END  
				
		END 
		ELSE
			BEGIN
				INSERT INTO [BD_HERRAMIENTAS].[carteras].[TabCart_Agenda_Empresa]
						VALUES (@ID_REGISTRO
								,@RUT_EMPRESA
								,@NOMBRE_EMPRESA
								,@RUT_EJECUTIVO
								,@GLOSA
								,@FECHA_INICO
								,@FECHA_FIN
								,@HORA_INICIO
								,@HORA_FIN
								,@FRECUENCIA
								,''
								,@DIA_SUCEDE
								,@TIPO_VISITA
								,@CODOFICINA
								,@ID_ANEXO)
			
			END 
		
	   END   

	IF @FRECUENCIA = 'Semanal'  
	  BEGIN 
			WHILE (@FECHA < DATEADD(MONTH, 12, GETDATE()))
			BEGIN
					SET @FECHA_INICO = (SELECT @FECHA WHERE DATENAME(WEEKDAY, @FECHA) IN (select StringValue from BD_HERRAMIENTAS.generales.parseJSON(@DIAS) where StringValue <> ''))
					SET @FECHA_FIN = (SELECT @FECHA_FN WHERE DATENAME(WEEKDAY, @FECHA_FN) IN (select StringValue from BD_HERRAMIENTAS.generales.parseJSON(@DIAS) where StringValue <> ''))
					IF @FECHA_INICO <> ''
					BEGIN
						INSERT INTO [BD_HERRAMIENTAS].[carteras].[TabCart_Agenda_Empresa]
						VALUES (@ID_REGISTRO
								,@RUT_EMPRESA
								,@NOMBRE_EMPRESA
								,@RUT_EJECUTIVO
								,@GLOSA
								,@FECHA_INICO
								,@FECHA_FIN
								,@HORA_INICIO
								,@HORA_FIN
								,@FRECUENCIA
								,@DIAS
								,0
								,@TIPO_VISITA
								,@CODOFICINA
								,@ID_ANEXO)
					END
					SET @FECHA = DATEADD(WEEKDAY, 1, @FECHA)
					SET @FECHA_FN = DATEADD(WEEKDAY, 1, @FECHA_FN)
			END
	  END
			
	IF @FRECUENCIA = 'Quincenal'  
	  BEGIN 
			WHILE (@FECHA < DATEADD(MONTH, 12, GETDATE()))
				BEGIN
				
					SET @FECHA_INICO = (SELECT @FECHA WHERE DATENAME(WEEKDAY, @FECHA) IN (select StringValue from BD_HERRAMIENTAS.generales.parseJSON(@DIAS) where StringValue <> ''))
					SET @FECHA_FIN = (SELECT @FECHA_FN WHERE DATENAME(WEEKDAY, @FECHA_FN) IN (select StringValue from BD_HERRAMIENTAS.generales.parseJSON(@DIAS) where StringValue <> ''))
					IF @FECHA_INICO <> ''
					BEGIN
						INSERT INTO [BD_HERRAMIENTAS].[carteras].[TabCart_Agenda_Empresa]
						VALUES (@ID_REGISTRO
								,@RUT_EMPRESA
								,@NOMBRE_EMPRESA
								,@RUT_EJECUTIVO
								,@GLOSA
								,@FECHA_INICO
								,@FECHA_FIN
								,@HORA_INICIO
								,@HORA_FIN
								,@FRECUENCIA
								,@DIAS
								,0
								,@TIPO_VISITA
								,@CODOFICINA
								,@ID_ANEXO)
					END
					SET @FECHA = DATEADD(WEEKDAY, 2, @FECHA)
					SET @FECHA_FN = DATEADD(WEEKDAY, 2, @FECHA_FN)
				END
			END

	  
	IF @FRECUENCIA = 'Mensual'  
	  BEGIN 
			WHILE (@FECHA < DATEADD(MONTH, 12, GETDATE()))
				BEGIN
				
					SET @FECHA_INICO = (SELECT @FECHA WHERE DATENAME(WEEKDAY, @FECHA) IN (@DIAS))
					SET @FECHA_FIN = (SELECT @FECHA_FN WHERE DATENAME(WEEKDAY, @FECHA_FN) IN (@DIAS))
					IF @FECHA_INICO <> ''
					BEGIN
						INSERT INTO [BD_HERRAMIENTAS].[carteras].[TabCart_Agenda_Empresa]
						VALUES (@ID_REGISTRO
								,@RUT_EMPRESA
								,@NOMBRE_EMPRESA
								,@RUT_EJECUTIVO
								,@GLOSA
								,@FECHA_INICO
								,@FECHA_FIN
								,@HORA_INICIO
								,@HORA_FIN
								,@FRECUENCIA
								,@DIAS
								,0
								,@TIPO_VISITA
								,@CODOFICINA
								,@ID_ANEXO)
					END
					SET @FECHA = DATEADD(DAYOFYEAR, 4, @FECHA)
					SET @FECHA_FN = DATEADD(DAYOFYEAR, 4, @FECHA_FN)
				END
	END  
END