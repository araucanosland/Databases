IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spLog_LogRolVerificador_Guardar]') AND type = 'P')
DROP PROCEDURE [dbo].[spLog_LogRolVerificador_Guardar]
GO
CREATE PROCEDURE [dbo].[spLog_LogRolVerificador_Guardar]
(
	@Id varchar(350),
    @RutEjecutivo varchar(12),
    @CodSucursal int,
    @RutAfiliado varchar(15),
    @Anexo int,
    @RutEmpresa varchar(15), 
    @NombreEmpresa varchar(250),
    @Cotiza bit = null,
    @Grado bit = null,
    @SeguroCesantia bit = null,
    @ProEmpleo bit = null,
    @LeyEspecifica bit = null,
    @LeyEspecifica2 bit = null,

    @TotalHaberes int = null,
    @BonosExtras int = null,
    @DescuentoLegalMes1 int = null, 
    @DescuentoLegalMes2 int = null,
    @DescuentoLegalMes3 int = null,
    @Promedio int = null,
    @RentaDepurada int= null, 
    @RentaDepuradaCMR int = null,
    @TotalDescuento int = null,
    @OtrosDescuentos int = null,
    @ValorCuotaCredito int = null,
    @ValorCuotaCreditoComp int = null,
    @Resultado1 varchar(350) = null,
    @Resultado2 varchar(350) = null
)
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity varchar(350)

	SET @identity = @Id

	IF @identity != ''
	BEGIN
		UPDATE TabMotor_RolVerificador SET 
			TotalHaberes = @TotalHaberes,
			BonosExtras = @BonosExtras,
			DescuentoLegalMes1 = @DescuentoLegalMes1,
			DescuentoLegalMes2 = @DescuentoLegalMes2,
			DescuentoLegalMes3 = @DescuentoLegalMes3,
			Promedio = @Promedio,
			RentaDepurada = @RentaDepurada,
			RentaDepuradaCMR = @RentaDepuradaCMR,
			TotalDescuento = @TotalDescuento,
			OtrosDescuentos = @OtrosDescuentos,
			ValorCuotaCredito = @ValorCuotaCredito,
			ValorCuotaCreditoComp = @ValorCuotaCreditoComp,
			Resultado2 = @Resultado2
			
		WHERE Id = @identity
	END
	ELSE
	BEGIN
		SELECT @identity = NEWID()
	
		INSERT INTO TabMotor_RolVerificador
		(
			Id,
			RutEjecutivo,
			CodSucursal,
			RutAfiliado,
			Anexo,
			RutEmpresa,
			NombreEmpresa,
			Cotiza,
			Grado,
			SeguroCesantia,
			ProEmpleo,
			LeyEspecifica,
			LeyEspecifica2,

			TotalHaberes,
			BonosExtras,
			DescuentoLegalMes1,
			DescuentoLegalMes2,
			DescuentoLegalMes3,
			Promedio,
			RentaDepurada,
			RentaDepuradaCMR,
			TotalDescuento,
			OtrosDescuentos,
			ValorCuotaCredito,
			ValorCuotaCreditoComp,
			Resultado1,
			Resultado2,
			FechaCreacion
		)
		VALUES
		(
			@identity,
			@RutEjecutivo,
			@CodSucursal,
			@RutAfiliado,
			@Anexo,
			@RutEmpresa,
			@NombreEmpresa,
			@Cotiza,
			@Grado,
			@SeguroCesantia,
			@ProEmpleo,
			@LeyEspecifica,
			@LeyEspecifica2,

			@TotalHaberes,
			@BonosExtras,
			@DescuentoLegalMes1,
			@DescuentoLegalMes2,
			@DescuentoLegalMes3,
			@Promedio,
			@RentaDepurada,
			@RentaDepuradaCMR,
			@TotalDescuento,
			@OtrosDescuentos,
			@ValorCuotaCredito,
			@ValorCuotaCreditoComp,
			@Resultado1,
			@Resultado2,
			getDate()
		)

	END

	SELECT @identity as Id
END