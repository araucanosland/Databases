IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[scafi].[spMotor_ListarTipoDato]') AND type = 'P')
DROP PROCEDURE [scafi].[spMotor_ListarTipoDato]
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [scafi].[spMotor_ListarTipoDato]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select  distinct iTipoDato,TipoDato from scafi.TabMotor_Contactibilidad
END