IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_Detalle_Entrevista]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_Detalle_Entrevista]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Lista_Detalle_Entrevista] --2
@ID_ENTREVISTA INT
AS
BEGIN 
	SELECT A.IdDetalleEntrevista
	,A.IdEntrevista 
	,A.Tema
	,A.SubTema
	,A.Semaforo
	,A.Alerta
	,A.FechaResolucion
	,A.Comentarios
	,A.RutEjeIngreso
	,A.FechaIngreso
	,A.Compromiso
	,B.Nombre NombreEjecutivo
	,A.FlagActualizacion
	,A.IdDetalleOrigen
	FROM [carteras].[TabCart_DetalleEntrevista] A
	LEFT JOIN dbo.TabMotor_Dotacion B 
	ON A.RutEjeIngreso = B.Rut and B.Periodo = dbo.fnMotor_ObtenerPeriodoActual()
	WHERE IdEntrevista = @ID_ENTREVISTA
	ORDER BY A.FechaIngreso DESC
END