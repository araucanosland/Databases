IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Respuesta_Guardar]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Respuesta_Guardar]
GO
CREATE PROCEDURE [fichas].[spFicha_Respuesta_Guardar]
(
	@resp_id int,
	@nuberespuesta_id int,
	@pregunta_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:54:16
-- Tabla Principal        : TabFicha_Respuesta
-- Descripcion            : Guarda un registro en la tabla TabFicha_Respuesta
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @resp_id

	IF @identity > 0
	BEGIN
		UPDATE TabFicha_Respuesta SET 
			nuberespuesta_id = @nuberespuesta_id,
			pregunta_id = @pregunta_id
		WHERE resp_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabFicha_Respuesta
		(
			nuberespuesta_id,
			pregunta_id
		)
		VALUES
		(
			@nuberespuesta_id,
			@pregunta_id
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END