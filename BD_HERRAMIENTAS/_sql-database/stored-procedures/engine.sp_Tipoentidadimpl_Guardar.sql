IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Tipoentidadimpl_Guardar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Tipoentidadimpl_Guardar]
GO
CREATE PROCEDURE [engine].[sp_Tipoentidadimpl_Guardar]
(
	@CodTipoEntidad int,
	@RutEntidad int,
	@RutPersonalidadJuridica int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:42:20
-- Tabla Principal        : TipoEntidadImpl
-- Descripcion            : Guarda un registro en la tabla TipoEntidadImpl
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @CodTipoEntidad

	IF @identity > 0
	BEGIN
		UPDATE TipoEntidadImpl SET 
			CodTipoEntidad = @CodTipoEntidad,
			RutEntidad = @RutEntidad,
			RutPersonalidadJuridica = @RutPersonalidadJuridica
		WHERE CodTipoEntidad = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TipoEntidadImpl
		(
			CodTipoEntidad,
			RutEntidad,
			RutPersonalidadJuridica
		)
		VALUES
		(
			@CodTipoEntidad,
			@RutEntidad,
			@RutPersonalidadJuridica
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END