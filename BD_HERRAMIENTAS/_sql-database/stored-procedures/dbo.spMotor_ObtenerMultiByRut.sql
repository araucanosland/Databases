IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ObtenerMultiByRut]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ObtenerMultiByRut]
GO

CREATE PROCEDURE [dbo].[spMotor_ObtenerMultiByRut]
(
	@RutEjecutivo varchar(50)
)
AS
-- =============================================
-- Autor                  : Carlos Pradenas
-- Fecha de Creacion      : 12-04-2017 17:59:27
-- Tabla Principal        : TabMotor_Gestion
-- Descripcion            : Guarda un registro en la tabla TabMotor_Gestion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

		SELECT *
		FROM TabMotor_Dotacion 
		where (Rut = @RutEjecutivo or Rut = @RutEjecutivo + 'I') 
		and Periodo = dbo.fnMotor_ObtenerPeriodoActual() 

END