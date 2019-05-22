IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[proceso].[sp_AfiliadosFalabella]') AND type = 'P')
DROP PROCEDURE [proceso].[sp_AfiliadosFalabella]
GO
CREATE PROCEDURE [proceso].[sp_AfiliadosFalabella]
  @RutAfiliado AS varchar(20) 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

select *
from proceso.Afiliado_Falabella
where RutAfiliado = @RutAfiliado

END