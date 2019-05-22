IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Tipoendidad_Guardar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Tipoendidad_Guardar]
GO
CREATE PROCEDURE [engine].[sp_Tipoendidad_Guardar]
(
	@CodTipoEntidad int,
	@NombreTipoEntidad varchar(255)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:41:19
-- Tabla Principal        : TipoEndidad
-- Descripcion            : Guarda un registro en la tabla TipoEndidad
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @CodTipoEntidad

	IF @identity > 0
	BEGIN
		UPDATE TipoEndidad SET 
			NombreTipoEntidad = @NombreTipoEntidad
		WHERE CodTipoEntidad = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TipoEndidad
		(
			NombreTipoEntidad
		)
		VALUES
		(
			@NombreTipoEntidad
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END