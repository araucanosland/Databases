IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_ObtenerEmpresaPorNombreRutOHolding]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_ObtenerEmpresaPorNombreRutOHolding]
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [carteras].[spMotorCartera_ObtenerEmpresaPorNombreRutOHolding]
	-- Add the parameters for the stored procedure here
	(
	@Entrada varchar(250)
	)


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

Select convert(varchar(50),RutEmpresa) +'-'+convert(varchar(50),dvempresa) RutEmpresa
,NombreEmpresa, NombreHolding Holding
from [BD_HERRAMIENTAS].[carteras].[TabCart_Empresas]
where ((convert(varchar(50),RutEmpresa) +'-'+convert(varchar(50),dvempresa) like '%'+@Entrada+'%') or (NombreEmpresa like '%' + @Entrada + '%') or (NombreHolding like '%' + @Entrada + '%')  ) 

END