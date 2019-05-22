IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Entidad_Guardar]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Entidad_Guardar]
GO
CREATE PROCEDURE [engine].[sp_Entidad_Guardar]
(
	@RutEntidad int,
	@DvEntidad varchar(2),
	@NombreEntidad varchar(200),
	@EsPersonalidadJuridica bit
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:39:38
-- Tabla Principal        : Entidad
-- Descripcion            : Guarda un registro en la tabla Entidad
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @RutEntidad

	IF @identity > 0
	BEGIN
		UPDATE Entidad SET 
			RutEntidad = @RutEntidad,
			DvEntidad = @DvEntidad,
			NombreEntidad = @NombreEntidad,
			EsPersonalidadJuridica = @EsPersonalidadJuridica
		WHERE RutEntidad = @identity
	END
	ELSE
	BEGIN
		INSERT INTO Entidad
		(
			RutEntidad,
			DvEntidad,
			NombreEntidad,
			EsPersonalidadJuridica
		)
		VALUES
		(
			@RutEntidad,
			@DvEntidad,
			@NombreEntidad,
			@EsPersonalidadJuridica
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END