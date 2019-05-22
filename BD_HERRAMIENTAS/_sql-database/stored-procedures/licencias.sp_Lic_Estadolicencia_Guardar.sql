IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Estadolicencia_Guardar]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Estadolicencia_Guardar]
GO
CREATE PROCEDURE [licencias].[sp_Lic_Estadolicencia_Guardar]
(
	@CodEstado int,
	@Nombre varchar(255)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 28-09-2017 16:35:47
-- Tabla Principal        : TabLic_EstadoLicencia
-- Descripcion            : Guarda un registro en la tabla TabLic_EstadoLicencia
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @CodEstado

	IF @identity > 0
	BEGIN
		UPDATE TabLic_EstadoLicencia SET 
			Nombre = @Nombre
		WHERE CodEstado = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabLic_EstadoLicencia
		(
			Nombre
		)
		VALUES
		(
			@Nombre
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END