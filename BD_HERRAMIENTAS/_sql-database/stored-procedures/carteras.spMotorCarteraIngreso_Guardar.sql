IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCarteraIngreso_Guardar]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCarteraIngreso_Guardar]
GO


CREATE PROCEDURE [carteras].[spMotorCarteraIngreso_Guardar]
(
	@IdEmpresaIngreso int,
	@Token varchar(250),
	@EmpresaRut varchar(50),
	@EmpresaNombre varchar(250),
	@EmpresaTipoEjecutivo int,
	@EmpresaRutEjecutivo varchar(11),
	@EmpresaNombreEjecutivo varchar(250)
)
AS

BEGIN

	SET NOCOUNT ON;
	DECLARE @identity int
	DECLARE @CodSucursal int = BD_REPORTES.negocios.fnSca_ObtenerOficinaByToken(@Token)
	DECLARE @FechaIngreso datetime= getdate()
	--SELECT @FechaIngreso
	DECLARE @Periodo varchar(6)
	SELECT @Periodo=(SELECT replace(convert(date, @FechaIngreso, 105),'-',''))
	--SELECT @Periodo
	DECLARE @EX INT = 0
	SET @identity = @IdEmpresaIngreso
	IF @identity > 0
	BEGIN
		UPDATE [BD_HERRAMIENTAS].[carteras].[TabCart_IngresoCarteraEmpresa] SET 
			EmpresaRut=@EmpresaRut,
			EmpresaNombre=@EmpresaNombre,
			EmpresaTipoEjecutivo=@EmpresaTipoEjecutivo,
			EmpresaRutEjecutivo=@EmpresaRutEjecutivo,
			EmpresaNombreEjecutivo=@EmpresaNombreEjecutivo,
			Periodo=@Periodo,
			Cod_Sucursal=@CodSucursal,
			@FechaIngreso=@FechaIngreso,
			EmpresaFechaActualizacion=GETDATE()
			

		WHERE IdEmpresaIngreso = @identity
	END
	ELSE
	BEGIN
		
		select @EX = COUNT(*) 
		from [BD_HERRAMIENTAS].[carteras].[TabCart_IngresoCarteraEmpresa]
		where EmpresaRut =@EmpresaRut
		--and EmpresaRutEjecutivo = @EmpresaRutEjecutivo
		and EmpresaTipoEjecutivo=@EmpresaTipoEjecutivo
		and Cod_Sucursal=@CodSucursal
		

		IF @EX > 0 
		BEGIN 
			RAISERROR('Error de Ingreso, no se puede ingresar, favor revisar que el ejecutivo no pertenezca mas de una vez a una empresa',16,1);
		END 
		ELSE
		BEGIN

				INSERT INTO [carteras].[TabCart_IngresoCarteraEmpresa]
					([EmpresaRut]
					,[EmpresaNombre]
					,[EmpresaTipoEjecutivo]
					,[EmpresaRutEjecutivo]
					,[EmpresaNombreEjecutivo]
					,[Periodo]
					,[Cod_Sucursal]
					,[EmpresaFechaIngreso])
				VALUES
				(
					@EmpresaRut,
					@EmpresaNombre,
					@EmpresaTipoEjecutivo,
					@EmpresaRutEjecutivo,
					@EmpresaNombreEjecutivo,
					@Periodo,
					@CodSucursal,
					@FechaIngreso
				)

				SELECT @identity = SCOPE_IDENTITY()
		END

	END

	SELECT @identity
END