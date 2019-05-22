IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Desarrollo_Guardar]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Desarrollo_Guardar]
GO
CREATE PROCEDURE [fichas].[spFicha_Desarrollo_Guardar]
(
	@desa_id bigint,
	@encabezado_id int,
	@respuesta_id int,
	@texto varchar(500)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:52:16
-- Tabla Principal        : TabFicha_Desarrollo
-- Descripcion            : Guarda un registro en la tabla TabFicha_Desarrollo
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity bigint

	SET @identity = @desa_id

	IF @identity > 0
	BEGIN
		UPDATE TabFicha_Desarrollo SET 
			encabezado_id = @encabezado_id,
			respuesta_id = @respuesta_id,
			texto = @texto
		WHERE desa_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabFicha_Desarrollo
		(
			encabezado_id,
			respuesta_id,
			texto
		)
		VALUES
		(
			@encabezado_id,
			@respuesta_id,
			@texto
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END