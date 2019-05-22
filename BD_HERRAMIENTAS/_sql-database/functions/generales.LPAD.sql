IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[generales].[LPAD]') AND type = 'FN')
DROP FUNCTION [generales].[LPAD]
GO
CREATE FUNCTION [generales].[LPAD]
(
    @string VARCHAR(MAX), -- Initial string
    @length INT,          -- Size of final string
    @pad CHAR             -- Pad character
)
RETURNS VARCHAR(MAX)
AS
BEGIN
    RETURN REPLICATE(@pad, @length - LEN(@string)) + @string;
END