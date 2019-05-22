IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ObtenerEjecutivosOficinaByToken]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ObtenerEjecutivosOficinaByToken]
GO
CREATE PROCEDURE [dbo].[spMotor_ObtenerEjecutivosOficinaByToken]
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

	DECLARE @COD_OFI INT
	DECLARE @PERIODO INT = dbo.fnMotor_ObtenerPeriodoActual()  --(select MAX(Periodo) from TabMotor_Dotacion)
	DECLARE @RUT_EJEC VARCHAR(50) = security.fnSca_ObtenerRutByToken(@Token)



		SELECT @COD_OFI = Cod_Sucursal
		FROM TabMotor_Dotacion 
		where Rut = @RUT_EJEC
		and Periodo = @PERIODO


		SELECT *
		FROM TabMotor_Dotacion 
		where Cod_Sucursal=@COD_OFI
		and Periodo = @PERIODO
		union 
		select @PERIODO, '0','0','0','Libres Oficina', @COD_OFI, '', '','','',0,'','','',21,'','','','','','','','','','','',''


END