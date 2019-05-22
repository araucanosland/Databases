IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_MantencionGestion_Historial]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_MantencionGestion_Historial]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Lista_MantencionGestion_Historial]--9
@ID_GEST_MANTENCION INT
AS
BEGIN 
select 
		A.IdGesMantencion
		,A.RutEmpresa
		,A.Tema
		,A.FechaIngreso
		,A.SubTema
		,A.RutEjeIngreso
		,A.Comentarios
		,B.Nombre NombreEjecutivo
		,A.FlagActualizacion
		,A.Alerta
		,A.IdDetalleOrigen
		from [CARTERAS].[TabCart_DetalleGestionMantencion] A
		INNER JOIN dbo.TabMotor_Dotacion B 
		ON A.RutEjeIngreso = B.Rut and B.Periodo = dbo.fnMotor_ObtenerPeriodoActual()
		WHERE FlagActualizacion = 1 and A.IdDetalleOrigen = @ID_GEST_MANTENCION
		ORDER BY A.FechaIngreso DESC
	
	--SELECT * FROM [CARTERAS].[TabCart_DetalleGestionMantencion] where FlagActualizacion = 1
	
END