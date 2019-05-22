IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Lista_Rol_Empresa]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Lista_Rol_Empresa]
GO
CREATE PROCEDURE [dbo].[spMotor_Lista_Rol_Empresa]
@IdAnexo INT
AS
BEGIN
  SELECT 
  	[IdAnexo],
	[RutEmpresa],
	[NombreEmpresa]
  FROM [BD_HERRAMIENTAS].[dbo].[TabMotor_EmpresaRolVerificador]
  where IdAnexo = @IdAnexo 

END