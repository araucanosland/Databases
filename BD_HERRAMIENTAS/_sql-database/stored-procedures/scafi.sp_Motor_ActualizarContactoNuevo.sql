IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[scafi].[sp_Motor_ActualizarContactoNuevo]') AND type = 'P')
DROP PROCEDURE [scafi].[sp_Motor_ActualizarContactoNuevo]
GO

CREATE PROCEDURE [scafi].[sp_Motor_ActualizarContactoNuevo]
	-- Add the parameters for the stored procedure here
		
		(
		@RutAfiliado int,
		@ValorDatoAnt varchar(250),
		@ValorDatoNew varchar(250),
		@iTipoDato int,
		@TipoDato varchar(150),
		@iClasifDato int,
		@ClasifDato varchar(150),
		@Token varchar(50),
		@Oficina int
		)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update  BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad
	set ValorDato =@ValorDatoNew,
		iTipoDato=@iTipoDato,
		TipoDato=@TipoDato,
		iClasifDato=@iClasifDato,
		ClasifDato=@ClasifDato,
		FechaCreacion=getdate(),
		OrigenCreacion='Motor',
		FechaIntento=getdate(),
		ResultIntento='Contactado',
		OrigenIntento='Motor',
		FechaContacto=GETDATE(),
		OrigenContacto='Motor',
		RutEjecGEstion= security.fnSca_ObtenerRutByToken(@Token),
		Oficina= @Oficina,
		IndiceContactab=1
	where RutAfiliado=@RutAfiliado
	and ValorDato=@ValorDatoAnt
END