IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Ingresolicencia_Guardar_DESA]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Ingresolicencia_Guardar_DESA]
GO


CREATE PROCEDURE [licencias].[sp_Lic_Ingresolicencia_Guardar_DESA]
(
	@CodIngreso bigint,
	@RutAfiliado varchar(50),
	@NombreAfiliado varchar(200),
	@SinDatosEnSistema bit,
	@FormatoLM varchar(50),
	@FolioLicencia varchar(100),
	@Oficina int,
	@Token varchar(50),
	@CodEstado int,
	@FechaIngreso datetime,
	@OficinaDerivacion int
	
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 28-09-2017 16:37:20
-- Tabla Principal        : TabLic_IngresoLicencia
-- Descripcion            : Guarda un registro en la tabla TabLic_IngresoLicencia
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity bigint
	DECLARE @RUT_EJECUTIVO VARCHAR(50) = security.fnSca_ObtenerRutByToken(@Token)
	DECLARE @EX INT = 0, @OFC_EX VARCHAR(100), @FEC_EX VARChAR(50)
	DECLARE @OficinaToken int = security.fnSca_ObtenerOficinaByToken(@Token)
	DECLARE @EsMismaOfi INT=0
	DECLARE @FlagEstado int =0
	DECLARE @ERRMSG VARCHAR(200)
	SET @identity = @CodIngreso

	select @identity=CodIngreso,@EsMismaOfi=1 
		from BD_HERRAMIENTAS.licencias.TabLic_IngresoLicencia_desa
		where RutAfiliado =@RutAfiliado
		and FolioLicencia = @FolioLicencia 
		and @identity=0
		and Oficina=@OficinaToken

		 IF @OficinaDerivacion>1
	 BEGIN
	 set @FlagEstado=1
	 END
	 ELSE
	 BEGIN
	 set @FlagEstado=0
	 END

	IF @identity > 0 
	BEGIN
	if @EsMismaOfi=1
	begin
	SELECT @OFC_EX = y.Oficina, @FEC_EX = CONVERT(VARCHAR(20),CONVERT(DATE,x.FechaIngreso))
			FROM BD_HERRAMIENTAS.licencias.TabLic_IngresoLicencia_desa x
			INNER JOIN dbo.TabMotor_Oficinas y ON x.Oficina = y.Cod_Oficina
			WHERE x.RutAfiliado =@RutAfiliado
			AND x.FolioLicencia = @FolioLicencia
			AND x.Oficina=@OficinaToken

			set @ERRMSG = '[0001];Licencia ya existe en Motor. Fecha de Ingreso: ' + @FEC_EX 

			RAISERROR(@ERRMSG,16,1);
	end
	else
	begin
	UPDATE BD_HERRAMIENTAS.licencias.TabLic_IngresoLicencia_desa SET 
			RutAfiliado = @RutAfiliado,
			FolioLicencia = @FolioLicencia,
			Oficina = @Oficina,
			RutEjecutivo = @RUT_EJECUTIVO,
			CodEstado = @CodEstado,
			NombreAfiliado = @NombreAfiliado,
			FechaIngreso=@FechaIngreso,
			FlagEstado=@FlagEstado,
			OficinaDerivada=@OficinaDerivacion
		WHERE CodIngreso = @identity
	end


		
	END
	ELSE
	BEGIN

		select @EX = COUNT(*) 
		from BD_HERRAMIENTAS.licencias.TabLic_IngresoLicencia_desa
		where RutAfiliado =@RutAfiliado
		and FolioLicencia = @FolioLicencia --or Oficina<>@OficinaToken
		and Oficina<>@OficinaToken

	


		IF @EX > 0 
		BEGIN 


			SELECT @OFC_EX = y.Oficina, @FEC_EX = CONVERT(VARCHAR(20),CONVERT(DATE,x.FechaIngreso))
			FROM BD_HERRAMIENTAS.licencias.TabLic_IngresoLicencia_desa x
			INNER JOIN dbo.TabMotor_Oficinas y ON x.Oficina = y.Cod_Oficina
			WHERE x.RutAfiliado =@RutAfiliado
			AND x.FolioLicencia = @FolioLicencia
			AND x.Oficina<>@OficinaToken

			set @ERRMSG ='[0002];Licencia ya existe en Motor. Fecha de Ingreso: ' + @FEC_EX + ', Oficina de Ingreso: ' + @OFC_EX + ' '+''+'¿Desea ser derivada a la Oficina Actual?'

			RAISERROR(@ERRMSG,16,1);
		END 
		ELSE
		BEGIN--55695593

				INSERT INTO BD_HERRAMIENTAS.licencias.TabLic_IngresoLicencia_desa
				(
					RutAfiliado,
					NombreAfiliado,
					FolioLicencia,
					Oficina,
					RutEjecutivo,
					CodEstado,
					FechaIngreso,
					SinDatosEnSistema,
					FormatoLM,
					FlagEstado,
					OficinaDerivada
				)
				VALUES
				(
					@RutAfiliado,
					@NombreAfiliado,
					@FolioLicencia,
					@Oficina,
					@RUT_EJECUTIVO,
					@CodEstado,
					@FechaIngreso,
					@SinDatosEnSistema,--,
					@FormatoLM,
					@FlagEstado,
					@OficinaDerivacion

				)

				SELECT @identity = SCOPE_IDENTITY()
		END

	END

	SELECT @identity
END