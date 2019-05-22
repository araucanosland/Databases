IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Atributo_Guardar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Atributo_Guardar]
GO
CREATE PROCEDURE [engine].[sp_Atributo_Guardar]
(
	@CodAttr varchar(255),
	@CodCamp int,
	@Etiqueta varchar(255),
	@TipoDato varchar(50)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:25:01
-- Tabla Principal        : Atributo
-- Descripcion            : Guarda un registro en la tabla Atributo
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity varchar(255)

	SET @identity = @CodAttr

	IF @identity > 0
	BEGIN
		UPDATE Atributo SET 
			CodAttr = @CodAttr,
			CodCamp = @CodCamp,
			Etiqueta = @Etiqueta,
			TipoDato = @TipoDato
		WHERE CodAttr = @identity
	END
	ELSE
	BEGIN
		INSERT INTO Atributo
		(
			CodAttr,
			CodCamp,
			Etiqueta,
			TipoDato
		)
		VALUES
		(
			@CodAttr,
			@CodCamp,
			@Etiqueta,
			@TipoDato
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END