IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Ausencia_Guardar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Ausencia_Guardar]
GO

CREATE PROCEDURE [dbo].[spMotor_Ausencia_Guardar]
(
	@aus_id int,
	@ejec_rut varchar(255),
	@aus_fecha_inicio datetime,
	@aus_fecha_fin datetime,
	@tipo_ausencia_id int,
	@aus_cantidad_dias int,
	@aus_comentarios varchar(500)
)
AS
-- =============================================
-- Autor                  : Carlos Pradenas
-- Fecha de Creacion      : 28-06-2017 00:00:31
-- Tabla Principal        : TabMotor_Ausencia
-- Descripcion            : Guarda un registro en la tabla TabMotor_Ausencia
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int
	DECLARE @IN_ERROR INT
	DECLARE @IN_CHOKE INT
	SET @identity = @aus_id


	/*VALIDACIONES*/

	SELECT @IN_ERROR = COUNT(*)
	FROM TabMotor_Ausencia 
	WHERE ejec_rut = @ejec_rut
	AND (
						(CONVERT(DATE,@aus_fecha_inicio) between CONVERT(DATE,aus_fecha_inicio) and CONVERT(DATE,aus_fecha_fin)) 
				OR  (CONVERT(DATE,@aus_fecha_fin) between CONVERT(DATE,aus_fecha_inicio) and CONVERT(DATE,aus_fecha_fin))
				OR 	(CONVERT(DATE,aus_fecha_inicio) between CONVERT(DATE,@aus_fecha_inicio) and CONVERT(DATE,@aus_fecha_fin))
				OR 	(CONVERT(DATE,aus_fecha_fin) between CONVERT(DATE,@aus_fecha_inicio) and CONVERT(DATE,@aus_fecha_fin))
		) 
	AND ((CONVERT(DATE,@aus_fecha_inicio) between CONVERT(DATE,aus_fecha_inicio) and CONVERT(DATE,aus_fecha_fin)) 
				OR (CONVERT(DATE,@aus_fecha_fin) between CONVERT(DATE,aus_fecha_inicio) and CONVERT(DATE,aus_fecha_fin)))


	IF @IN_ERROR > 0 and @identity = 0
	BEGIN
				select @IN_CHOKE =  count(*)
				from TabMotor_Ausencia
				where @aus_fecha_inicio <= aus_fecha_fin
				and ejec_rut = @ejec_rut

				IF(@IN_CHOKE > 0)
				BEGIN				
					update TabMotor_Ausencia
					set aus_fecha_fin = DATEADD(DAY, -1, @aus_fecha_inicio)
					where @aus_fecha_inicio <= aus_fecha_fin
					and ejec_rut = @ejec_rut


					INSERT INTO TabMotor_Ausencia
					(
						ejec_rut,
						aus_fecha_inicio,
						aus_fecha_fin,
						tipo_ausencia_id,
						aus_cantidad_dias,
						aus_comentarios
					)
					VALUES
					(
						@ejec_rut,
						@aus_fecha_inicio,
						@aus_fecha_fin,
						@tipo_ausencia_id,
						@aus_cantidad_dias,
						@aus_comentarios
					)

			SELECT @identity = SCOPE_IDENTITY()

				END
				ELSE 
				BEGIN
					RAISERROR ('No puede ingresar ausencia con fechas cruzadas',16,1);
				END
	END
	ELSE
	BEGIN



		IF @identity > 0
		BEGIN
			UPDATE TabMotor_Ausencia SET 
				ejec_rut = @ejec_rut,
				aus_fecha_inicio = @aus_fecha_inicio,
				aus_fecha_fin = @aus_fecha_fin,
				tipo_ausencia_id = @tipo_ausencia_id,
				aus_cantidad_dias = @aus_cantidad_dias,
				aus_comentarios = @aus_comentarios 
			WHERE aus_id = @identity
		END
		ELSE
		BEGIN
			INSERT INTO TabMotor_Ausencia
			(
				ejec_rut,
				aus_fecha_inicio,
				aus_fecha_fin,
				tipo_ausencia_id,
				aus_cantidad_dias,
				aus_comentarios
			)
			VALUES
			(
				@ejec_rut,
				@aus_fecha_inicio,
				@aus_fecha_fin,
				@tipo_ausencia_id,
				@aus_cantidad_dias,
				@aus_comentarios
			)

			SELECT @identity = SCOPE_IDENTITY()
		END

	END
	SELECT @identity
END