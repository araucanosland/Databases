IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Recurso_Guardar]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Recurso_Guardar]
GO
CREATE PROCEDURE [security].[sp_Sca_Recurso_Guardar]
(
	@CodRecurso int,
	@Nombre varchar(255),
	@Descripcion varchar(255)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-09-2017 18:11:40
-- Tabla Principal        : TabSca_Recurso
-- Descripcion            : Guarda un registro en la tabla TabSca_Recurso
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @CodRecurso

	IF @identity > 0
	BEGIN
		UPDATE TabSca_Recurso SET 
			Nombre = @Nombre,
			Descripcion = @Descripcion
		WHERE CodRecurso = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabSca_Recurso
		(
			Nombre,
			Descripcion
		)
		VALUES
		(
			@Nombre,
			@Descripcion
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END