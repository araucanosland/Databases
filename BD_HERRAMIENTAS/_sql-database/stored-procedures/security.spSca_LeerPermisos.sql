IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[spSca_LeerPermisos]') AND type = 'P')
DROP PROCEDURE [security].[spSca_LeerPermisos]
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [security].[spSca_LeerPermisos]
	-- Add the parameters for the stored procedure here
	@grupo varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
/*select Grupo,Recurso,Nombre from security.TabSca_Permisos
where Grupo=@grupo*/

END