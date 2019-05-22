IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[spSca_ObtenerUsuarioByRut]') AND type = 'P')
DROP PROCEDURE [security].[spSca_ObtenerUsuarioByRut]
GO
CREATE PROCEDURE [security].[spSca_ObtenerUsuarioByRut]
	@RutUsuario VARCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * , usr_dominio as usr_doiminio
	FROM TabSca_Usuario
	--WHERE (usr_rut = @RutUsuario or usr_rut = '0' + @RutUsuario)
	WHERE ((usr_dominio is null and usr_rut = @RutUsuario or usr_rut = '0' + @RutUsuario) or (usr_dominio is not null and usr_dominio = @RutUsuario));

END