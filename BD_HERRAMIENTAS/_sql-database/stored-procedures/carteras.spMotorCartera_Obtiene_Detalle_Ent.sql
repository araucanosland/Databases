IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Obtiene_Detalle_Ent]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Obtiene_Detalle_Ent]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Obtiene_Detalle_Ent] --1
@ID_DETALLE_ENT INT
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
	WHERE A.IdDetalleEntrevista = @ID_DETALLE_ENT
	
END