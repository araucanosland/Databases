IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Fidelizacion_Guardar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Fidelizacion_Guardar]
GO
CREATE PROCEDURE [empresas].[spEmp_Fidelizacion_Guardar]
(
	@fide_id int,
	@fide_estamento varchar(255),
	@fide_actividad varchar(255),
	@fide_cobertura varchar(255),
	@fide_fecha_calendario date,
	@fide_fecha_accion datetime,
	@representante_id int,
	@cod_oficina int,
	@rut_ejecutivo varchar(50)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:51:03
-- Tabla Principal        : TabEmp_Fidelizacion
-- Descripcion            : Guarda un registro en la tabla TabEmp_Fidelizacion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @fide_id

	IF @identity > 0
	BEGIN
		UPDATE TabEmp_Fidelizacion SET 
			fide_estamento = @fide_estamento,
			fide_actividad = @fide_actividad,
			fide_cobertura = @fide_cobertura,
			fide_fecha_calendario = @fide_fecha_calendario,
			fide_fecha_accion = @fide_fecha_accion,
			representante_id = @representante_id,
			cod_oficina = @cod_oficina,
			rut_ejecutivo = @rut_ejecutivo
		WHERE fide_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabEmp_Fidelizacion
		(
			fide_estamento,
			fide_actividad,
			fide_cobertura,
			fide_fecha_calendario,
			fide_fecha_accion,
			representante_id,
			cod_oficina,
			rut_ejecutivo
		)
		VALUES
		(
			@fide_estamento,
			@fide_actividad,
			@fide_cobertura,
			@fide_fecha_calendario,
			@fide_fecha_accion,
			@representante_id,
			@cod_oficina,
			@rut_ejecutivo
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END