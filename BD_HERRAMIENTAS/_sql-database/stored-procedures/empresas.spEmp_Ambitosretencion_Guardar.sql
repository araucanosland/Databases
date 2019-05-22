IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Ambitosretencion_Guardar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Ambitosretencion_Guardar]
GO
CREATE PROCEDURE [empresas].[spEmp_Ambitosretencion_Guardar]
(
	@aret_id int,
	@ambito_id int,
	@retencion_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 10-04-2018 17:55:21
-- Tabla Principal        : TabEmp_AmbitosRetencion
-- Descripcion            : Guarda un registro en la tabla TabEmp_AmbitosRetencion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @aret_id

	IF @identity > 0
	BEGIN
		UPDATE TabEmp_AmbitosRetencion SET 
			ambito_id = @ambito_id,
			retencion_id = @retencion_id
		WHERE aret_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabEmp_AmbitosRetencion
		(
			ambito_id,
			retencion_id
		)
		VALUES
		(
			@ambito_id,
			@retencion_id
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END