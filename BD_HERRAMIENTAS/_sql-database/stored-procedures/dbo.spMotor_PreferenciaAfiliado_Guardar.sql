IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_PreferenciaAfiliado_Guardar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_PreferenciaAfiliado_Guardar]
GO








CREATE PROCEDURE [dbo].[spMotor_PreferenciaAfiliado_Guardar]
(
	@Afiliado_rut int,
	@Fecha_accion datetime,
	@Tipo_preferencia varchar(50),
	@Valor_preferencia varchar(500),
	@Valida bit
)
AS
-- =============================================
-- Autor                  : Charly
-- Fecha de Creacion      : 29-05-2017 17:45:02
-- Tabla Principal        : TabMotor_Preferencia_Afiliado
-- Descripcion            : Guarda un registro en la tabla TabMotor_Preferencia_Afiliado
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @existe int 
	
	SELECT @existe = COUNT(*) 
	FROM TabMotor_Preferencia_Afiliado 
	WHERE Afiliado_rut = @Afiliado_rut
	AND Tipo_preferencia = @Tipo_preferencia

	IF @existe > 0
	BEGIN
		UPDATE TabMotor_Preferencia_Afiliado SET 
			Afiliado_rut = @Afiliado_rut,
			Fecha_accion = @Fecha_accion,
			Tipo_preferencia = @Tipo_preferencia,
			Valor_preferencia = @Valor_preferencia,
			Valida = @Valida
		WHERE Afiliado_rut = @Afiliado_rut 
		AND Tipo_preferencia = @Tipo_preferencia
	END
	ELSE
	BEGIN
		INSERT INTO TabMotor_Preferencia_Afiliado
		(
			Afiliado_rut,
			Fecha_accion,
			Tipo_preferencia,
			Valor_preferencia,
			Valida
		)
		VALUES
		(
			@Afiliado_rut,
			@Fecha_accion,
			@Tipo_preferencia,
			@Valor_preferencia,
			@Valida
		)

		
	END

	SELECT @existe
END