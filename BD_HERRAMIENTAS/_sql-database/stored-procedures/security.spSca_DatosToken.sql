IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[spSca_DatosToken]') AND type = 'P')
DROP PROCEDURE [security].[spSca_DatosToken]
GO
CREATE PROCEDURE [security].[spSca_DatosToken]
@AuthToken varchar(50)
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	select * from TabSca_Tokens where AuthToken = @AuthToken;

END