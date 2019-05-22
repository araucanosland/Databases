IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[sp_MotorCartera_ListaEjecutivoCargo]') AND type = 'P')
DROP PROCEDURE [carteras].[sp_MotorCartera_ListaEjecutivoCargo]
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [carteras].[sp_MotorCartera_ListaEjecutivoCargo] 
	-- Add the parameters for the stored procedure here
 @TokenEjecutivo AS varchar(40),
 @CodTipo as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select a.Rut,a.Nombre,b.Nombre_TipoCargo,a.Sucursal from BD_HERRAMIENTAS.dbo.TabMotor_Dotacion A
inner join [BD_HERRAMIENTAS].[carteras].[TabCart_TipoEjecutivo] B
on a.Cargo=Nombre_TipoCargo
where Periodo=(select max(periodo) from BD_HERRAMIENTAS.dbo.TabMotor_Dotacion)
and b.id_TipoCargo=@CodTipo
and cod_sucursal=BD_REPORTES.negocios.fnSca_ObtenerOficinaByToken(@TokenEjecutivo)
order by cargo asc

END