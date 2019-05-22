IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCarteraIngresoAdmin_Eliminar]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCarteraIngresoAdmin_Eliminar]
GO
CREATE PROCEDURE [carteras].[spMotorCarteraIngresoAdmin_Eliminar]
(
	@CodIngreso int
)
AS

BEGIN

	SET NOCOUNT ON;

	
	DELETE FROM BD_HERRAMIENTAS.carteras.[TabCart_IngresoCarteraEmpresaAdmin]
	WHERE IdSucursalEmpresa = @CodIngreso
	delete [carteras].[TabCart_EjecAsignacion]
	where IdSucursalEmpresa=@CodIngreso
	DELETE BD_HERRAMIENTAS.carteras.TabCart_CarteraEmpresas
	WHERE Id_EmpresaAdmin=@CodIngreso



	
END