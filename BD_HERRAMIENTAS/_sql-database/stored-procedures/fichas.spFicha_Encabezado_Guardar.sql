IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Encabezado_Guardar]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Encabezado_Guardar]
GO
CREATE PROCEDURE [fichas].[spFicha_Encabezado_Guardar]
(
	@enc_id int,
	@cuestionario_id int,
	@rut_empresa varchar(50),
	@estamento varchar(100),
	@nombre_funcionario varchar(150),
	@cargo_funcionario varchar(150),
	@cantidad_empleados int,
	@cod_sucursal int,
	@rut_ejecutivo varchar(20),
	@fecha_entrevista DATE 
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:52:45
-- Tabla Principal        : TabFicha_Encabezado
-- Descripcion            : Guarda un registro en la tabla TabFicha_Encabezado
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @enc_id

	IF @identity > 0
	BEGIN
		UPDATE TabFicha_Encabezado SET 
			cuestionario_id = @cuestionario_id,
			rut_empresa = @rut_empresa,
			estamento = @estamento,
			nombre_funcionario = @nombre_funcionario,
			cargo_funcionario = @cargo_funcionario,
			cantidad_empleados = @cantidad_empleados,
			cod_sucursal = @cod_sucursal,
			rut_ejecutivo = @rut_ejecutivo,
			fecha_entrevista = @fecha_entrevista,
			fecha_actualizacion = getdate()
		WHERE enc_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabFicha_Encabezado
		(
			cuestionario_id,
			rut_empresa,
			estamento,
			nombre_funcionario,
			cargo_funcionario,
			cantidad_empleados,
			cod_sucursal,
			rut_ejecutivo,
			fecha_entrevista,
			fecha_actualizacion
		)
		VALUES
		(
			@cuestionario_id,
			@rut_empresa,
			@estamento,
			@nombre_funcionario,
			@cargo_funcionario,
			@cantidad_empleados,
			@cod_sucursal,
			@rut_ejecutivo,
		  @fecha_entrevista,
			getdate()
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END