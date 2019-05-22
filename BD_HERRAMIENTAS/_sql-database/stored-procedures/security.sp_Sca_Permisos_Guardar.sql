IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Permisos_Guardar]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Permisos_Guardar]
GO
CREATE PROCEDURE [security].[sp_Sca_Permisos_Guardar]
(
	@CodPermiso int,
	@CodRecurso int,
	@CodRol int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-09-2017 18:11:16
-- Tabla Principal        : TabSca_Permisos
-- Descripcion            : Guarda un registro en la tabla TabSca_Permisos
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @CodPermiso

	IF @identity > 0
	BEGIN
		UPDATE TabSca_Permisos SET 
			CodRecurso = @CodRecurso,
			CodRol = @CodRol
		WHERE CodPermiso = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabSca_Permisos
		(
			CodRecurso,
			CodRol
		)
		VALUES
		(
			@CodRecurso,
			@CodRol
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END