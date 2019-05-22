IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Permisodetalle_Guardar]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Permisodetalle_Guardar]
GO
CREATE PROCEDURE [security].[sp_Sca_Permisodetalle_Guardar]
(
	@CodPerDetalle int,
	@CodPermiso int,
	@Controlador varchar(255),
	@Accion varchar(255)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-09-2017 18:10:40
-- Tabla Principal        : TabSca_PermisoDetalle
-- Descripcion            : Guarda un registro en la tabla TabSca_PermisoDetalle
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @CodPerDetalle

	IF @identity > 0
	BEGIN
		UPDATE TabSca_PermisoDetalle SET 
			CodPerDetalle = @CodPerDetalle,
			CodPermiso = @CodPermiso,
			Controlador = @Controlador,
			Accion = @Accion
		WHERE CodPerDetalle = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabSca_PermisoDetalle
		(
			CodPerDetalle,
			CodPermiso,
			Controlador,
			Accion
		)
		VALUES
		(
			@CodPerDetalle,
			@CodPermiso,
			@Controlador,
			@Accion
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END