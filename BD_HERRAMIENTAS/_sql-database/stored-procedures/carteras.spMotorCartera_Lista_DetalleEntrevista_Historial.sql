IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_DetalleEntrevista_Historial]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_DetalleEntrevista_Historial]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Lista_DetalleEntrevista_Historial]-- 4
@ID_DETALLE_ENTREVISTA INT
AS
BEGIN 
select  A.IdEntrevista
		,A.IdDetalleEntrevista
		,A.Tema
		,A.FechaIngreso
		,A.SubTema
		,A.RutEjeIngreso
		,A.Comentarios
		,B.Nombre NombreEjecutivo
		,A.FlagActualizacion
		,A.Alerta
		,A.IdDetalleOrigen
		,A.Semaforo
		,A.Compromiso
		,A.FechaResolucion
		from [carteras].[TabCart_DetalleEntrevista] A
		INNER JOIN dbo.TabMotor_Dotacion B 
		ON A.RutEjeIngreso = B.Rut and B.Periodo = dbo.fnMotor_ObtenerPeriodoActual()
		WHERE FlagActualizacion = 1 and A.IdDetalleOrigen = @ID_DETALLE_ENTREVISTA
		ORDER BY A.FechaIngreso DESC
END