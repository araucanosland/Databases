IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[spSca_ObtenerCargo]') AND type = 'P')
DROP PROCEDURE [security].[spSca_ObtenerCargo]
GO
CREATE PROCEDURE [security].[spSca_ObtenerCargo]
	@token VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements. security.spSca_ObtenerCargo
	SET NOCOUNT ON;

	SELECT Cargo
	FROM security.TabSca_Usuario a
	inner join dbo.TabMotor_Dotacion b on a.usr_rut = b.Rut and b.Periodo = (select max(Periodo) from dbo.TabMotor_Dotacion)
	inner join security.TabSca_Tokens c on a.usr_id = c.UserId
	where ExpiresOn > GETDATE()
	and c.AuthToken = @token

END