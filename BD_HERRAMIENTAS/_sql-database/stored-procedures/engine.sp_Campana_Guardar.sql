IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Campana_Guardar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Campana_Guardar]
GO
CREATE PROCEDURE [engine].[sp_Campana_Guardar]
(
	@CodCamp int,
	@IdentidadCamp varchar(100),
	@Activa bit
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:31:26
-- Tabla Principal        : Campaña
-- Descripcion            : Guarda un registro en la tabla Campaña
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @CodCamp

	IF @identity > 0
	BEGIN
		UPDATE Campaña SET 
			IdentidadCamp = @IdentidadCamp,
			Activa = @Activa
		WHERE CodCamp = @identity
	END
	ELSE
	BEGIN
		INSERT INTO Campaña
		(
			IdentidadCamp,
			Activa
		)
		VALUES
		(
			@IdentidadCamp,
			@Activa
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END