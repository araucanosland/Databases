IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[FN_getEdad]') AND type = 'FN')
DROP FUNCTION [dbo].[FN_getEdad]
GO
CREATE  FUNCTION [dbo].[FN_getEdad]
(
	@fechaNac varchar(20)
 )
 RETURNS int

 AS
 BEGIN

  
RETURN (Select (cast(datediff(dd,Convert(date,@fechaNac),GETDATE()) / 365 as int)))

END