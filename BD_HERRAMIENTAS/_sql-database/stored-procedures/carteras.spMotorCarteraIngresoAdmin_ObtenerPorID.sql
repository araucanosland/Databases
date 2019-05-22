IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCarteraIngresoAdmin_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCarteraIngresoAdmin_ObtenerPorID]
GO
create PROCEDURE [carteras].[spMotorCarteraIngresoAdmin_ObtenerPorID]
(
	@CodIngreso int
)
AS

BEGIN

	SET NOCOUNT ON;

	SELECT *
	FROM
		 [BD_HERRAMIENTAS].[carteras].[TabCart_IngresoCarteraEmpresaAdmin]
	WHERE
		IdEmpresaIngreso = @CodIngreso

END