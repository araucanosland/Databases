IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCarteraAdminIngreso_UpdateAcepta]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCarteraAdminIngreso_UpdateAcepta]
GO

CREATE PROCEDURE [carteras].[spMotorCarteraAdminIngreso_UpdateAcepta]
(
	@CodIngreso int
)
AS

Begin
update [BD_HERRAMIENTAS].[carteras].[TabCart_IngresoCarteraEmpresaAdmin]
set FlagAcepta=1
WHERE IdEmpresaIngreso=@CodIngreso
End