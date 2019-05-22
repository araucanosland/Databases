IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Pregunta_Guardar]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Pregunta_Guardar]
GO
CREATE PROCEDURE [fichas].[spFicha_Pregunta_Guardar]
(
	@preg_id int,
	@cuestionario_id int,
	@titulo varchar(255),
	@item varchar(255),
	@pregunta_relacionada int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:53:45
-- Tabla Principal        : TabFicha_Pregunta
-- Descripcion            : Guarda un registro en la tabla TabFicha_Pregunta
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @preg_id

	IF @identity > 0
	BEGIN
		UPDATE TabFicha_Pregunta SET 
			cuestionario_id = @cuestionario_id,
			titulo = @titulo,
			item = @item,
			pregunta_relacionada = @pregunta_relacionada
		WHERE preg_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabFicha_Pregunta
		(
			cuestionario_id,
			titulo,
			item,
			pregunta_relacionada
		)
		VALUES
		(
			@cuestionario_id,
			@titulo,
			@item,
			@pregunta_relacionada
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END