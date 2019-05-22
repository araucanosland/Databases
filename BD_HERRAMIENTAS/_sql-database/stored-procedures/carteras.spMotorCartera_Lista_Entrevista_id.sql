IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Lista_Entrevista_id]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Lista_Entrevista_id]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Lista_Entrevista_id]-- 2
@ID_ENTREVISTA int
AS
BEGIN 
select
	A.IdEntrevista
	,A.RutEmpresa
	,A.FechaEntrevista
	,'Entrevista' Tipo
	,A.NombreContacto
	,A.Cargo
	,A.Estamento
	,A.Comentarios
	,A.RutEjeIngreso
	,A.FechaIngreso
	,B.Nombre NombreEjecutivo
	from [carteras].[TabCart_CabeceraEntrevista] A
	INNER JOIN dbo.TabMotor_Dotacion B 
	ON A.RutEjeIngreso = B.Rut and B.Periodo = dbo.fnMotor_ObtenerPeriodoActual()
	where IdEntrevista = @ID_ENTREVISTA
END