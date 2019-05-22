IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[fnMotor_ObtenerPeriodoActual]') AND type = 'FN')
DROP FUNCTION [dbo].[fnMotor_ObtenerPeriodoActual]
GO
CREATE FUNCTION [dbo].[fnMotor_ObtenerPeriodoActual]()
RETURNS INT
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'
  RETURN CONVERT(INT,CONVERT(VARCHAR(4),YEAR(GETDATE())) + RIGHT(replicate('0',2) + CONVERT(VARCHAR(2),MONTH(GETDATE())),2))
END