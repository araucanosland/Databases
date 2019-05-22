IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[sp_MotorCartera_ListaEjecutivoAdmin]') AND type = 'P')
DROP PROCEDURE [carteras].[sp_MotorCartera_ListaEjecutivoAdmin]
GO
CREATE PROCEDURE [carteras].[sp_MotorCartera_ListaEjecutivoAdmin] 
	-- Add the parameters for the stored procedure here
 @TokenEjecutivo AS varchar(40)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select a.Rut
	  ,a.Nombre
	  --,b.Nombre_TipoCargo
	  ,a.Cargo as Nombre_TipoCargo
	  ,a.Sucursal 
From BD_HERRAMIENTAS.dbo.TabMotor_Dotacion A
--inner join [BD_HERRAMIENTAS].[carteras].[TabCart_TipoEjecutivo] B
--on a.Cargo=Nombre_TipoCargo
where Periodo=(select max(periodo) from BD_HERRAMIENTAS.dbo.TabMotor_Dotacion)
and cod_sucursal=BD_REPORTES.negocios.fnSca_ObtenerOficinaByToken(@TokenEjecutivo)
order by Nombre asc

END