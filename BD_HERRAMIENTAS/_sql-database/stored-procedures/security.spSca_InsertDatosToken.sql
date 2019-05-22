IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[spSca_InsertDatosToken]') AND type = 'P')
DROP PROCEDURE [security].[spSca_InsertDatosToken]
GO
CREATE PROCEDURE [security].[spSca_InsertDatosToken]
@UserId varchar(20),
@AuthToken varchar(50),
@IssuedOn datetime,
@ExpiresOn datetime

AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'
--declare @a int =0

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	--SET TRANSACTION ISOLATION LEVEL READ COMMITTED SNAPSHOT
	insert into TabSca_Tokens( UserId,AuthToken,IssuedOn, ExpiresOn) values (@UserId,@AuthToken,@IssuedOn,@ExpiresOn);

END