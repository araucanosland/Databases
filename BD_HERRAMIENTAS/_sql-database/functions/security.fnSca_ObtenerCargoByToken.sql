IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[fnSca_ObtenerCargoByToken]') AND type = 'FN')
DROP FUNCTION [security].[fnSca_ObtenerCargoByToken]
GO
CREATE FUNCTION [security].[fnSca_ObtenerCargoByToken]
( 
	@Token AS varchar(40) 
)
RETURNS varchar(100)
AS
BEGIN
  
DECLARE @Ret VARCHAR(100)


SELECT @Ret =  c.Cargo
FROM security.TabSca_Tokens a WITH (NOLOCK)
INNER JOIN security.TabSca_Usuario b WITH (NOLOCK) ON a.UserId = b.usr_id
INNER JOIN dbo.TabMotor_Dotacion c WITH (NOLOCK) ON b.usr_rut = c.Rut and c.Periodo = (select max(Periodo) from dbo.TabMotor_Dotacion)
WHERE a.AuthToken = @Token
AND a.ExpiresOn > GETDATE()

RETURN @Ret
END