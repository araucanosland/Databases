IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ObtenerEjecutivosOficinaByTokenHistorica]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ObtenerEjecutivosOficinaByTokenHistorica]
GO


CREATE PROCEDURE [dbo].[spMotor_ObtenerEjecutivosOficinaByTokenHistorica]
(
	@Token varchar(50),
	@Periodo INT
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

		DECLARE @COD_OFI INT = security.fnSca_ObtenerOficinaByToken(@Token)
		DECLARE @RUT_EJEC VARCHAR(50) = security.fnSca_ObtenerRutByToken(@Token)
		





/*	IF @Periodo = 201801 
	BEGIN
			SET @Periodo = 201711
	END
	ELSE
	BEGIN
		SET @Periodo = @Periodo - 1
	END*/


		SELECT *
		FROM dbo.TabMotor_Dotacion 
		where Cod_Sucursal=@COD_OFI
		and Periodo = @Periodo
		and Cod_Sucursal <> 0
		and Cargo not in (select cargo from [TabMotor_CargosNoAsinables])


END