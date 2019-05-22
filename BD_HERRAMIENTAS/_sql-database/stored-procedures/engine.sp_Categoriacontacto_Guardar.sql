IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Categoriacontacto_Guardar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Categoriacontacto_Guardar]
GO
CREATE PROCEDURE [engine].[sp_Categoriacontacto_Guardar]
(
	@CodCategoria int,
	@NombreCategoria varchar(255)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:32:11
-- Tabla Principal        : CategoriaContacto
-- Descripcion            : Guarda un registro en la tabla CategoriaContacto
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @CodCategoria

	IF @identity > 0
	BEGIN
		UPDATE CategoriaContacto SET 
			NombreCategoria = @NombreCategoria
		WHERE CodCategoria = @identity
	END
	ELSE
	BEGIN
		INSERT INTO CategoriaContacto
		(
			NombreCategoria
		)
		VALUES
		(
			@NombreCategoria
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END