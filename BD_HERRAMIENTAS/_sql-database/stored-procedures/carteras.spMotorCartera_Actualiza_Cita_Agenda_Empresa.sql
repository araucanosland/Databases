IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Actualiza_Cita_Agenda_Empresa]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Actualiza_Cita_Agenda_Empresa]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Actualiza_Cita_Agenda_Empresa]
@TOKEN VARCHAR(250)
,@ID_AGENDA INT
--,@ID_REGISTRO INT
,@RUT_EMPRESA VARCHAR(20)

,@GLOSA VARCHAR(500)
,@FECHA_INICO DATETIME
,@FECHA_FIN DATETIME
,@HORA_INICIO VARCHAR(20)
,@HORA_FIN VARCHAR(20)
--,@FRECUENCIA VARCHAR(100)
--,@DIAS VARCHAR(300)
,@TIPO_VISITA VARCHAR(200)
--,@DIA_SUCEDE INT
AS
BEGIN

DECLARE @CODOFICINA INT = CONVERT(INT, security.fnSca_ObtenerOficinaByToken(@TOKEN))
DECLARE @RUT_EJECUTIVO VARCHAR(15) = CONVERT(VARCHAR, security.fnSca_ObtenerRutByToken(@TOKEN))	
	--IF @ID_AGENDA != 0 AND @ID_REGISTRO = 0
	--  BEGIN 
	  
		UPDATE [BD_HERRAMIENTAS].[carteras].[TabCart_Agenda_Empresa]
		SET Glosa = @GLOSA
		   ,FechaInico = @FECHA_INICO
		   ,FechaFin = @FECHA_FIN
		   ,HoraInicio = @HORA_INICIO
		   ,HoraFin = @HORA_FIN
		   --,Frecuencia = @FRECUENCIA
		   --,Dias = @DIAS
		   ,TipoVisita = @TIPO_VISITA
		   --,DiasSucede = @DIA_SUCEDE
		   
		WHERE IdAgenda = @ID_AGENDA
		AND RutEmpresa = @RUT_EMPRESA 
		AND CodOficina = @CODOFICINA
		--AND RutEjecutivo = @RUT_EJECUTIVO
	--END 
	
	--IF @ID_AGENDA = 0 AND @ID_REGISTRO != 0
	--  BEGIN 
	  
	--	UPDATE [BD_HERRAMIENTAS].[carteras].[TabCart_Agenda_Empresa]
	--	SET Glosa = @GLOSA
	--	   ,FechaInico = @FECHA_INICO
	--	   ,FechaFin = @FECHA_FIN
	--	   ,HoraInicio = @HORA_INICIO
	--	   ,HoraFin = @HORA_FIN
	--	   ,Frecuencia = @FRECUENCIA
	--	   ,Dias = @DIAS
	--	   ,TipoVisita = @TIPO_VISITA
	--	   ,DiasSucede = @DIA_SUCEDE
		   
	--	WHERE IdRegistro = @ID_REGISTRO 
	--	AND RutEmpresa = @RUT_EMPRESA 
	--	AND CodOficina = @CODOFICINA
		
	--END 
END