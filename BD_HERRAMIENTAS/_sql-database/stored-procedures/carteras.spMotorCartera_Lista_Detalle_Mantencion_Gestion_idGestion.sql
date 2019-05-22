IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_Detalle_Mantencion_Gestion_idGestion]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_Detalle_Mantencion_Gestion_idGestion]
GO
create PROCEDURE [carteras].[spMotorCartera_Lista_Detalle_Mantencion_Gestion_idGestion]
@ID_GES_MANTENCION INT
AS
BEGIN 
select 
		A.IdGesMantencion
		,A.IdCabGesMantencion
		,A.RutEmpresa
		,A.Tema
		,A.FechaIngreso
		,A.SubTema
		,A.RutEjeIngreso
		,A.Comentarios
		,A.Alerta
		,A.RutAfiliado
		,B.Nombre NombreEjecutivo
		,A.FlagActualizacion
	from [carteras].[TabCart_DetalleGestionMantencion] A
		INNER JOIN dbo.TabMotor_Dotacion B 
		ON A.RutEjeIngreso = B.Rut and B.Periodo = dbo.fnMotor_ObtenerPeriodoActual()
		WHERE A.IdGesMantencion = @ID_GES_MANTENCION	
	
END