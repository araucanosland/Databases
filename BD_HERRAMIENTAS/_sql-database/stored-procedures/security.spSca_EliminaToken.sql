IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[spSca_EliminaToken]') AND type = 'P')
DROP PROCEDURE [security].[spSca_EliminaToken]
GO
CREATE PROCEDURE [security].[spSca_EliminaToken]

@AuthToken varchar(50)

AS
BEGIN
  
	delete from  TabSca_Tokens
	where AuthToken=@AuthToken;

END