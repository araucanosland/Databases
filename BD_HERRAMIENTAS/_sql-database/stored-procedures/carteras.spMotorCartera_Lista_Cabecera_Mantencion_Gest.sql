IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_Cabecera_Mantencion_Gest]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_Cabecera_Mantencion_Gest]
GO
create PROCEDURE [carteras].[spMotorCartera_Lista_Cabecera_Mantencion_Gest]
@ID_CAB_GES_MANTENCION INT
AS
BEGIN 
select
		A.IdCabGesMantencion
	   ,A.RutEmpresa	
	   ,A.Tipo
	   ,A.Comentarios
	   ,A.RutEjeIngreso
	   ,A.FechaIngreso
	   ,B.Nombre NombreEjecutivo
	FROM [carteras].[TabCart_CabeceraGestionMantencion] A
	INNER JOIN dbo.TabMotor_Dotacion B 
	ON A.RutEjeIngreso = B.Rut and B.Periodo = dbo.fnMotor_ObtenerPeriodoActual()
	WHERE IdCabGesMantencion = @ID_CAB_GES_MANTENCION
END