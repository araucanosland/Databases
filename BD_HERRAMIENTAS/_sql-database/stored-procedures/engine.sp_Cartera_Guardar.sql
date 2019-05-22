IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Cartera_Guardar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Cartera_Guardar]
GO
Create PROCEDURE [engine].[sp_Cartera_Guardar]
(
	@CodigoOficina integer,
	@TipoCartera varchar(50),
	@RutEjecutivo varchar(50),
	@RutEmpresa varchar(50),
	@FechaActualizacion datetime
)
AS

--BEGIN

	--SET NOCOUNT ON;

	--DECLARE @identity int

	--SET @identity = @CodigoOficina

	--IF @identity > 0
	--BEGIN
	--	UPDATE Campaña SET 
	--		IdentidadCamp = @IdentidadCamp,
	--		Activa = @Activa
	--	WHERE CodCamp = @identity
	--END
	--ELSE
	BEGIN
		INSERT INTO desarrollo.Carteras
		(
			--cod_oficina,
			tipo_cartera,
			rut_ejecutivo,
			rut_empresa,
			fecha_actualizacion			
		)
		VALUES
		(
			--@CodigoOficina,
			@TipoCartera,
			@RutEjecutivo,
			@RutEmpresa,
			@FechaActualizacion
		)

		--SELECT @identity = SCOPE_IDENTITY()
	END

	--SELECT @identity
--END