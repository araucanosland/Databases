IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCarteraIngreso_Eliminar]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCarteraIngreso_Eliminar]
GO
CREATE PROCEDURE [carteras].[spMotorCarteraIngreso_Eliminar]
(
	@CodIngreso int
)
AS

BEGIN

	SET NOCOUNT ON;

	
	DELETE FROM BD_HERRAMIENTAS.carteras.TabCart_IngresoCarteraEmpresa
	WHERE IdEmpresaIngreso = @CodIngreso

	
END