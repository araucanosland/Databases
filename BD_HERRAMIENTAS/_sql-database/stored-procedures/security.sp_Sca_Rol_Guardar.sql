IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Rol_Guardar]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Rol_Guardar]
GO
CREATE PROCEDURE [security].[sp_Sca_Rol_Guardar]
(
	@CodRol int,
	@Nombre varchar(255)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-09-2017 18:11:57
-- Tabla Principal        : TabSca_Rol
-- Descripcion            : Guarda un registro en la tabla TabSca_Rol
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @CodRol

	IF @identity > 0
	BEGIN
		UPDATE TabSca_Rol SET 
			Nombre = @Nombre
		WHERE CodRol = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabSca_Rol
		(
			Nombre
		)
		VALUES
		(
			@Nombre
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END