IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[scafi].[sp_Motor_ObtenerContacto]') AND type = 'P')
DROP PROCEDURE [scafi].[sp_Motor_ObtenerContacto]
GO

CREATE PROCEDURE [scafi].[sp_Motor_ObtenerContacto]
	-- Add the parameters for the stored procedure here
		@RutAfiliado int,
		@ValorDato varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select  RutAfiliado
		   ,iTipoDato
		   ,TipoDato
		   ,iClasifDato
		   ,ClasifDato
		   ,ValorDato from BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad
	where RutAfiliado=@RutAfiliado
	and ValorDato=@ValorDato
END