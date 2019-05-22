IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_Detalle_MantencionGestion]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_Detalle_MantencionGestion]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Lista_Detalle_MantencionGestion]--2
@ID_GES_MANTENCION INT
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
		,A.Tipo
		,A.Alerta
		,A.RutAfiliado
		,B.Nombre NombreEjecutivo
		,A.FlagActualizacion
		from [carteras].[TabCart_GestionMantencion] A
		INNER JOIN dbo.TabMotor_Dotacion B 
		ON A.RutEjeIngreso = B.Rut and B.Periodo = dbo.fnMotor_ObtenerPeriodoActual()
		WHERE A.IdGesMantencion = @ID_GES_MANTENCION	
	
END