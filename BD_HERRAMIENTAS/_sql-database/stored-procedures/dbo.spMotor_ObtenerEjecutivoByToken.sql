IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ObtenerEjecutivoByToken]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ObtenerEjecutivoByToken]
GO
CREATE PROCEDURE [dbo].[spMotor_ObtenerEjecutivoByToken]
(
	@Token varchar(50)
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
		where Rut = security.fnSca_ObtenerRutByToken(@Token)
		and Periodo = dbo.fnMotor_ObtenerPeriodoActual() 


END