IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Prospeccion_Guardar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Prospeccion_Guardar]
GO
CREATE PROCEDURE [empresas].[spEmp_Prospeccion_Guardar]
(
	@pros_id int,
	@empresa_id int,
	@pros_dotacion int,
	@pros_caja_origen varchar(200),
	@ejecutivo_rut varchar(20),
	@oficina int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-04-2018 14:16:05
-- Tabla Principal        : TabEmp_Prospeccion
-- Descripcion            : Guarda un registro en la tabla TabEmp_Prospeccion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @pros_id

	IF @identity > 0
	BEGIN
		UPDATE TabEmp_Prospeccion SET 
			empresa_id = @empresa_id,
			pros_dotacion = @pros_dotacion,
			pros_caja_origen = @pros_caja_origen,
			ejecutivo_rut = @ejecutivo_rut,
			oficina = @oficina
		WHERE pros_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabEmp_Prospeccion
		(
			empresa_id,
			pros_dotacion,
			pros_caja_origen,
			ejecutivo_rut,
			oficina
		)
		VALUES
		(
			@empresa_id,
			@pros_dotacion,
			@pros_caja_origen,
			@ejecutivo_rut,
			@oficina
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END