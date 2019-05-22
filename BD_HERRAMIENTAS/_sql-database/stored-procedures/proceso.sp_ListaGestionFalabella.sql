IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[proceso].[sp_ListaGestionFalabella]') AND type = 'P')
DROP PROCEDURE [proceso].[sp_ListaGestionFalabella]
GO
CREATE PROCEDURE [proceso].[sp_ListaGestionFalabella]
  @Oficina AS int 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'
select * from proceso.Afiliado_Falabella_Gestion where Oficina = @Oficina
END