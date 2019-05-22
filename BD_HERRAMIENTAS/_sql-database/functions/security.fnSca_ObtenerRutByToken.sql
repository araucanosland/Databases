IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[fnSca_ObtenerRutByToken]') AND type = 'FN')
DROP FUNCTION [security].[fnSca_ObtenerRutByToken]
GO
CREATE FUNCTION [security].[fnSca_ObtenerRutByToken]
( 
	@Token AS varchar(40) 
)
RETURNS varchar(20)
AS
BEGIN
  
DECLARE @Ret VARCHAR(20)


SELECT @Ret = b.usr_rut 
FROM security.TabSca_Tokens a WITH (NOLOCK)
INNER JOIN security.TabSca_Usuario b WITH (NOLOCK) ON a.UserId = b.usr_id
WHERE a.AuthToken = @Token
AND a.ExpiresOn > GETDATE()

RETURN @Ret
END