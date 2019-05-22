IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_ListaEmpresaRut]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_ListaEmpresaRut]
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [carteras].[spMotorCartera_ListaEmpresaRut]
	-- Add the parameters for the stored procedure here
	(
	@Rut varchar(50)
	)


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

Select convert(varchar(50),RutEmpresa) +'-'+convert(varchar(50),dvempresa) RutEmpresa
,NombreEmpresa
from [BD_HERRAMIENTAS].[carteras].[TabCart_Empresas]
where convert(varchar(50),RutEmpresa) +'-'+convert(varchar(50),dvempresa)= @Rut

END