IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Asignapermiso_Guardar]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Asignapermiso_Guardar]
GO
CREATE PROCEDURE [security].[sp_Sca_Asignapermiso_Guardar]
(
	@CodPermiso int,
	@Grupo varchar(100)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 14-09-2017 11:18:53
-- Tabla Principal        : TabSca_AsignaPermiso
-- Descripcion            : Guarda un registro en la tabla TabSca_AsignaPermiso
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
		UPDATE TabSca_AsignaPermiso SET 
			CodPermiso = @CodPermiso,
			Grupo = @Grupo
		WHERE CodPermiso = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabSca_AsignaPermiso
		(
			CodPermiso,
			Grupo
		)
		VALUES
		(
			@CodPermiso,
			@Grupo
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END