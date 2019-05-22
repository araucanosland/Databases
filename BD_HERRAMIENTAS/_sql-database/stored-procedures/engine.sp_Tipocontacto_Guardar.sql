IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Tipocontacto_Guardar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Tipocontacto_Guardar]
GO
CREATE PROCEDURE [engine].[sp_Tipocontacto_Guardar]
(
	@CodTipo int,
	@NombreTipo varchar(255)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:41:02
-- Tabla Principal        : TipoContacto
-- Descripcion            : Guarda un registro en la tabla TipoContacto
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @CodTipo

	IF @identity > 0
	BEGIN
		UPDATE TipoContacto SET 
			NombreTipo = @NombreTipo
		WHERE CodTipo = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TipoContacto
		(
			NombreTipo
		)
		VALUES
		(
			@NombreTipo
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END