IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[generales].[EjecutivoNombreByRut]') AND type = 'FN')
DROP FUNCTION [generales].[EjecutivoNombreByRut]
GO

CREATE FUNCTION [generales].[EjecutivoNombreByRut]
(
    @rut VARCHAR(20)
)
RETURNS VARCHAR(200)
AS
BEGIN
    
DECLARE @r VARCHAR(200) = (select top 1 Nombre from dbo.TabMotor_Dotacion where Rut = @rut)

RETURN @r
END