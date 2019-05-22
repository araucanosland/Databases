IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[spSca_ObtenerUsuario]') AND type = 'P')
DROP PROCEDURE [security].[spSca_ObtenerUsuario]
GO
CREATE PROCEDURE [security].[spSca_ObtenerUsuario]
	@IdUsuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * , usr_dominio as usr_doiminio
	FROM TabSca_Usuario
	WHERE usr_id = @IdUsuario

END