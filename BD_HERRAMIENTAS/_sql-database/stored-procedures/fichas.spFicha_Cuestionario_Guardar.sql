IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Cuestionario_Guardar]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Cuestionario_Guardar]
GO
CREATE PROCEDURE [fichas].[spFicha_Cuestionario_Guardar]
(
	@cuest_id int,
	@descripcion varchar(500)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:51:31
-- Tabla Principal        : TabFicha_Cuestionario
-- Descripcion            : Guarda un registro en la tabla TabFicha_Cuestionario
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @cuest_id

	IF @identity > 0
	BEGIN
		UPDATE TabFicha_Cuestionario SET 
			descripcion = @descripcion
		WHERE cuest_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabFicha_Cuestionario
		(
			descripcion
		)
		VALUES
		(
			@descripcion
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END