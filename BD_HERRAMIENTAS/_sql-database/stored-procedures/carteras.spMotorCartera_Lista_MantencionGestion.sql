IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_MantencionGestion]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_MantencionGestion]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Lista_MantencionGestion]
@RUT_EMPRESA VARCHAR(15)
AS
BEGIN 
select 
		A.IdGesMantencion
		,A.RutEmpresa
		,A.Tema
		,A.FechaIngreso
		,'Mantención Gest.' Tipo
		,A.SubTema
		,A.RutEjeIngreso
		,A.Comentarios
		,A.Tipo as TipoGestion
		,B.Nombre NombreEjecutivo
		,A.FlagActualizacion
		,A.Alerta
		from [carteras].[TabCart_GestionMantencion] A
		INNER JOIN dbo.TabMotor_Dotacion B 
		ON A.RutEjeIngreso = B.Rut and B.Periodo = dbo.fnMotor_ObtenerPeriodoActual()
		WHERE A.RUTEMPRESA = @RUT_EMPRESA	
	
END