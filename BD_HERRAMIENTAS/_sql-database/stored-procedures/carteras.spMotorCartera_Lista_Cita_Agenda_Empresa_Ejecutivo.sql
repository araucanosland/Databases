IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_Cita_Agenda_Empresa_Ejecutivo]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_Cita_Agenda_Empresa_Ejecutivo]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Lista_Cita_Agenda_Empresa_Ejecutivo]--'ae3c438b-d2a4-4594-b52c-ee81bd014bb9', '61502000-1'
@TOKEN VARCHAR(300),
@RUT_EMPRESA VARCHAR(100),
@ID_ANEXO INT
AS 
BEGIN
DECLARE @N_CITAS INT = (select COUNT(IdAgenda) from [BD_HERRAMIENTAS].[carteras].[TabCart_Agenda_Empresa]
							where CONVERT(VARCHAR(10), FechaInico, 103)  = CONVERT(VARCHAR(10), getdate(), 103))
DECLARE @RUT_EJECUTIVO VARCHAR(15) = CONVERT(VARCHAR, security.fnSca_ObtenerRutByToken(@TOKEN))


	IF @RUT_EMPRESA != '0' 
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
		WHERE RutEjecutivo = @RUT_EJECUTIVO AND RutEmpresa = @RUT_EMPRESA
		AND IdAnexo = @ID_ANEXO
	 END
	 
	 IF @RUT_EMPRESA = '0'
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
		
	 END




		
END