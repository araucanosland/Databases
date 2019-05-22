IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Ambitosfidelizacion_Guardar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Ambitosfidelizacion_Guardar]
GO
CREATE PROCEDURE [empresas].[spEmp_Ambitosfidelizacion_Guardar]
(
	@afid_id int,
	@ambito_id int,
	@fidelizacion_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:48:55
-- Tabla Principal        : TabEmp_AmbitosFidelizacion
-- Descripcion            : Guarda un registro en la tabla TabEmp_AmbitosFidelizacion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @afid_id

	IF @identity > 0
	BEGIN
		UPDATE TabEmp_AmbitosFidelizacion SET 
			ambito_id = @ambito_id,
			fidelizacion_id = @fidelizacion_id
		WHERE afid_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabEmp_AmbitosFidelizacion
		(
			ambito_id,
			fidelizacion_id
		)
		VALUES
		(
			@ambito_id,
			@fidelizacion_id
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END