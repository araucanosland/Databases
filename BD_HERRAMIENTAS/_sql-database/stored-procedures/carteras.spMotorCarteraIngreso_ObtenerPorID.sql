IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCarteraIngreso_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCarteraIngreso_ObtenerPorID]
GO
create PROCEDURE [carteras].[spMotorCarteraIngreso_ObtenerPorID]
(
	@CodIngreso int
)
AS

BEGIN

	SET NOCOUNT ON;

	SELECT *
	FROM
		 [BD_HERRAMIENTAS].[carteras].[TabCart_IngresoCarteraEmpresa]
	WHERE
		IdEmpresaIngreso = @CodIngreso

END