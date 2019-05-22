IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Attrvalores_Guardar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Attrvalores_Guardar]
GO
CREATE PROCEDURE [engine].[sp_Attrvalores_Guardar]
(
	@CodAttr varchar(255),
	@CodCamp int,
	@CodAsignacion int,
	@ValorAttr varchar(255)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:30:37
-- Tabla Principal        : AttrValores
-- Descripcion            : Guarda un registro en la tabla AttrValores
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
		UPDATE AttrValores SET 
			CodAttr = @CodAttr,
			CodCamp = @CodCamp,
			CodAsignacion = @CodAsignacion,
			ValorAttr = @ValorAttr
		WHERE CodAttr = @identity
	END
	ELSE
	BEGIN
		INSERT INTO AttrValores
		(
			CodAttr,
			CodCamp,
			CodAsignacion,
			ValorAttr
		)
		VALUES
		(
			@CodAttr,
			@CodCamp,
			@CodAsignacion,
			@ValorAttr
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END