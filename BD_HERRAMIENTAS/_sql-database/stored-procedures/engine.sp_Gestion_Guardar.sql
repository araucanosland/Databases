IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Gestion_Guardar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Gestion_Guardar]
GO
CREATE PROCEDURE [engine].[sp_Gestion_Guardar]
(
	@CodGestion bigint,
	@CodAsignacion bigint,
	@FechaAccion datetime,
	@FechaCompromiso datetime,
	@CodEstadoGestion int,
	@NotaGestion varchar(500),
	@RutEjecutivo VARCHAR(50),
	@CodOficina INT
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:40:16
-- Tabla Principal        : Gestion
-- Descripcion            : Guarda un registro en la tabla Gestion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity bigint
	DECLARE @rter VARCHAR(20) = [security].[fnSca_ObtenerRutByToken](@RutEjecutivo);

	SET @identity = @CodGestion

	IF @identity > 0
	BEGIN
		UPDATE Gestion SET 
			CodAsignacion = @CodAsignacion,
			FechaAccion = @FechaAccion,
			FechaCompromiso = @FechaCompromiso,
			CodEstadoGestion = @CodEstadoGestion,
			NotaGestion = @NotaGestion,
			RutEjecutivo = @rter,
			CodOficina = @CodOficina
		WHERE CodGestion = @identity
	END
	ELSE
	BEGIN
		INSERT INTO Gestion
		(
			CodAsignacion,
			FechaAccion,
			FechaCompromiso,
			CodEstadoGestion,
			NotaGestion,
			RutEjecutivo,
			CodOficina
		)
		VALUES
		(
			@CodAsignacion,
			@FechaAccion,
			@FechaCompromiso,
			@CodEstadoGestion,
			@NotaGestion,
			@rter,
			@CodOficina
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END