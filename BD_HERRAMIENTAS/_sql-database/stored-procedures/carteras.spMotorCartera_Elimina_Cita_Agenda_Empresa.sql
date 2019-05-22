IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Elimina_Cita_Agenda_Empresa]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Elimina_Cita_Agenda_Empresa]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Elimina_Cita_Agenda_Empresa]
@TOKEN VARCHAR(250),
@ID_AGENDA INT,
@ID_REGISTRO INT,
@RUT_EMPRESA VARCHAR(20)
AS
BEGIN
	DECLARE @CODOFICINA INT = CONVERT(INT, security.fnSca_ObtenerOficinaByToken(@TOKEN))
	
	IF @ID_AGENDA != 0 AND @ID_REGISTRO = 0
	  BEGIN 
	  
		DELETE FROM [BD_HERRAMIENTAS].[carteras].[TabCart_Agenda_Empresa]
		WHERE IdAgenda = @ID_AGENDA
		AND RutEmpresa = @RUT_EMPRESA 
		AND CodOficina = @CODOFICINA
	END 
	
	IF @ID_AGENDA = 0 AND @ID_REGISTRO != 0
	  BEGIN 
	  
		DELETE FROM [BD_HERRAMIENTAS].[carteras].[TabCart_Agenda_Empresa]
		WHERE IdRegistro = @ID_REGISTRO 
		AND RutEmpresa = @RUT_EMPRESA 
		AND CodOficina = @CODOFICINA
		
	END 
 
END