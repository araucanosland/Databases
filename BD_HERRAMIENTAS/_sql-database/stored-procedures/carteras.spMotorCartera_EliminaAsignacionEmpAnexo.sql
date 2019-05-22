IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_EliminaAsignacionEmpAnexo]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_EliminaAsignacionEmpAnexo]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_EliminaAsignacionEmpAnexo]
	@Tipo varchar(15),
	@id int,
	@RutEjecutivo varchar(12)
AS
BEGIN
	If @Tipo='Empresas'
	BEGIN
		DELETE FROM BD_HERRAMIENTAS.[carteras].[TabCart_EjecAsignacionEmpresa] 
		WHERE IdSucursalEmpresa = @id and RutEjectAsignado = @RutEjecutivo
	END
	If @Tipo='FAnexo'
	BEGIN
		DELETE FROM BD_HERRAMIENTAS.[carteras].[TabCart_EjecAsigAnexo] 
		WHERE IdEmpresaAnexo = @id and RutEjecutivoAsigAnexo = @RutEjecutivo
	END
END