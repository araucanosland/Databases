IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Contacto_Guardar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Contacto_Guardar]
GO
CREATE PROCEDURE [engine].[sp_Contacto_Guardar]
(
	@CodTipoEntidad int,
	@RutEntidad int,
	@CodCategoria int,
	@CodTipo int,
	@ValorContacto varchar(200),
	@CodContacto bigint
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:38:25
-- Tabla Principal        : Contacto
-- Descripcion            : Guarda un registro en la tabla Contacto
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity bigint

	SET @identity = @CodContacto

	IF @identity > 0
	BEGIN
		UPDATE Contacto SET 
			CodTipoEntidad = @CodTipoEntidad,
			RutEntidad = @RutEntidad,
			CodCategoria = @CodCategoria,
			CodTipo = @CodTipo,
			ValorContacto = @ValorContacto
		WHERE CodContacto = @identity
	END
	ELSE
	BEGIN
		INSERT INTO Contacto
		(
			CodTipoEntidad,
			RutEntidad,
			CodCategoria,
			CodTipo,
			ValorContacto
		)
		VALUES
		(
			@CodTipoEntidad,
			@RutEntidad,
			@CodCategoria,
			@CodTipo,
			@ValorContacto
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END