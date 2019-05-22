IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[spMotor_ObtenerEmpresaByRut]') AND type = 'P')
DROP PROCEDURE [mae].[spMotor_ObtenerEmpresaByRut]
GO
CREATE PROCEDURE [mae].[spMotor_ObtenerEmpresaByRut]
  @Rut AS varchar(50)
AS
BEGIN

Select *
from [BD_HERRAMIENTAS].[carteras].[TabCart_Empresas]
where convert(varchar(50),RutEmpresa) +'-'+convert(varchar(50),dvempresa)= @Rut

END