IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_Cita_Agenda_Empresa_Cartera_DESA]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_Cita_Agenda_Empresa_Cartera_DESA]
GO
							
CREATE PROCEDURE [carteras].[spMotorCartera_Lista_Cita_Agenda_Empresa_Cartera_DESA]-- '96988680-4','0',0, '475fc730-3de9-48e0-aeac-3d05ec5c4a7f'
@RUT_EMPRESA VARCHAR(100)
,@RUT_EJECUTIVO VARCHAR(100)
,@ID_ANEXO INT
,@TOKEN VARCHAR(250)
AS 
BEGIN
DECLARE @N_CITAS INT = (select COUNT(IdAgenda) from [BD_HERRAMIENTAS].[carteras].[TabCart_Agenda_Empresa]
							where CONVERT(VARCHAR(10), FechaInico, 103)  = CONVERT(VARCHAR(10), getdate(), 103))
DECLARE @OFICINA INT = security.fnSca_ObtenerOficinaByToken(@Token)					
												
	IF @RUT_EMPRESA = '0' AND @RUT_EJECUTIVO = '0'
	  BEGIN 
		SELECT IdAgenda
			   ,IdRegistro
			   ,RutEmpresa
			   ,NombreEmpresa
			   ,RutEjecutivo
			   ,Glosa
			   ,FechaInico
			   ,FechaFin
			   ,Frecuencia
			   ,Dias
			   ,DiasSucede
			   ,TipoVisita
			   ,IdAnexo
			   ,HoraInicio
			   ,HoraFin
			   ,@N_CITAS NCitas
		FROM [BD_HERRAMIENTAS].[carteras].[TabCart_Agenda_Empresa]
		WHERE CodOficina = @OFICINA 
	 END
	
						
	IF @RUT_EMPRESA != '0' AND @ID_ANEXO = 0
	  BEGIN 
		SELECT IdAgenda
			   ,IdRegistro
			   ,RutEmpresa
			   ,NombreEmpresa
			   ,RutEjecutivo
			   ,Glosa
			   ,FechaInico
			   ,FechaFin
			   ,Frecuencia
			   ,Dias
			   ,DiasSucede
			   ,TipoVisita
			   ,IdAnexo
			   ,HoraInicio
			   ,HoraFin
			   ,@N_CITAS NCitas
		FROM [BD_HERRAMIENTAS].[carteras].[TabCart_Agenda_Empresa]
		WHERE RutEmpresa = @RUT_EMPRESA 
		AND CodOficina = @OFICINA 
	 END
	 
	 IF @ID_ANEXO != 0 AND @RUT_EMPRESA != '0'
	  BEGIN 
		SELECT IdAgenda
			   ,IdRegistro
			   ,RutEmpresa
			   ,NombreEmpresa
			   ,RutEjecutivo
			   ,Glosa
			   ,FechaInico
			   ,FechaFin
			   ,Frecuencia
			   ,Dias
			   ,DiasSucede
			   ,TipoVisita
			   ,IdAnexo
			   ,HoraInicio
			   ,HoraFin
			   ,@N_CITAS NCitas
		FROM [BD_HERRAMIENTAS].[carteras].[TabCart_Agenda_Empresa]
		WHERE RutEmpresa = @RUT_EMPRESA 
		AND IdAnexo = @ID_ANEXO
		AND CodOficina = @OFICINA 
	 END 

	IF @RUT_EJECUTIVO != '0' AND @RUT_EMPRESA = '0'
	  BEGIN 
		SELECT IdAgenda
			   ,IdRegistro
			   ,RutEmpresa
			   ,NombreEmpresa
			   ,RutEjecutivo
			   ,Glosa
			   ,FechaInico
			   ,FechaFin
			   ,Frecuencia
			   ,Dias
			   ,DiasSucede
			   ,TipoVisita
			   ,IdAnexo
			   ,HoraInicio
			   ,HoraFin
			   ,@N_CITAS NCitas
		FROM [BD_HERRAMIENTAS].[carteras].[TabCart_Agenda_Empresa]
		WHERE RutEjecutivo = @RUT_EJECUTIVO 
		AND CodOficina = @OFICINA 
	 END
END