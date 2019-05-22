IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Estadogestion_Guardar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Estadogestion_Guardar]
GO
CREATE PROCEDURE [engine].[sp_Estadogestion_Guardar]
(
	@CodEstado int,
	@Nombre varchar(255),
	@CodEstPadre int,
	@EsTerminal bit
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:39:58
-- Tabla Principal        : EstadoGestion
-- Descripcion            : Guarda un registro en la tabla EstadoGestion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @CodEstado

	IF @identity > 0
	BEGIN
		UPDATE EstadoGestion SET 
			Nombre = @Nombre,
			CodEstPadre = @CodEstPadre,
			EsTerminal = @EsTerminal
		WHERE CodEstado = @identity
	END
	ELSE
	BEGIN
		INSERT INTO EstadoGestion
		(
			Nombre,
			CodEstPadre,
			EsTerminal
		)
		VALUES
		(
			@Nombre,
			@CodEstPadre,
			@EsTerminal
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END