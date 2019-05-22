IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[scafi].[sp_Motor_ListarIndiceContacto]') AND type = 'P')
DROP PROCEDURE [scafi].[sp_Motor_ListarIndiceContacto]
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [scafi].[sp_Motor_ListarIndiceContacto]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
select IdEstado
,Descripcion 
from BD_HERRAMIENTAS.scafi.TabMotor_EstadoContactabilidad
order by IdEstado, IdEstadoPadre asc
END