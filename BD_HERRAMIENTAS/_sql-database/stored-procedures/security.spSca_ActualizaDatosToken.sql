IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[spSca_ActualizaDatosToken]') AND type = 'P')
DROP PROCEDURE [security].[spSca_ActualizaDatosToken]
GO
CREATE PROCEDURE [security].[spSca_ActualizaDatosToken]
@TokenId INT,
@UserId varchar(20),
@AuthToken varchar(50),
@IssuedOn datetime,
@ExpiresOn datetime

AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	--UPDATE TabSca_Tokens SET
	--ExpiresOn = @ExpiresOn 
	--where AuthToken = @AuthToken;
	

	select @AuthToken

END