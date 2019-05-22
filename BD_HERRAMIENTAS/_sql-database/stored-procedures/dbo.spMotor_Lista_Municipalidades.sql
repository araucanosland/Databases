IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Lista_Municipalidades]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Lista_Municipalidades]
GO
CREATE PROCEDURE [dbo].[spMotor_Lista_Municipalidades]
AS
BEGIN
  SELECT [idFechaCorte]
      ,[RutEmpresa]
      ,[DvEmpresa]
      ,[NombreEmpresa]
      ,[NombreHolding]
      ,[TipoEmpresa]
  FROM [BD_HERRAMIENTAS].[carteras].[TabCart_Empresas]
  where [NombreEmpresa] like '%MUNICIPALIDAD%'

END