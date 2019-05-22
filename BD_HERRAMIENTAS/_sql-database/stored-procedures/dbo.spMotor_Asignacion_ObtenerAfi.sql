IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Asignacion_ObtenerAfi]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Asignacion_ObtenerAfi]
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMotor_Asignacion_ObtenerAfi]
	-- Add the parameters for the stored procedure here
@Rut AS varchar(40)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Periodo,Afiliado_Rut,Afiliado_Dv,Nombre,Apellido,Empresa_Rut,Empresa_Dv,Empresa,MontoRenta,Segmento,PreAprobadoFinal,RiesgoMaxPreAprobado
	from TabMotor_Asignacion
   where Afiliado_Rut=@Rut--'19442084'
	 and Periodo=(select max(periodo) from TabMotor_Asignacion)
END