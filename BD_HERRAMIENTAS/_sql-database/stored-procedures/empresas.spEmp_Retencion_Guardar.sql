IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Retencion_Guardar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Retencion_Guardar]
GO
CREATE PROCEDURE [empresas].[spEmp_Retencion_Guardar]
(
	@ret_id int,
	@empresa_id int,
	@ret_estamento varchar(200),
	@ret_segmento varchar(100),
	@ret_dotacion int,
	@ret_caja_destino varchar(200),
	@ejecutivo_rut varchar(20),
	@oficina int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 10-04-2018 17:56:52
-- Tabla Principal        : TabEmp_Retencion
-- Descripcion            : Guarda un registro en la tabla TabEmp_Retencion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @ret_id

	IF @identity > 0
	BEGIN
		UPDATE TabEmp_Retencion SET 
			empresa_id = @empresa_id,
			ret_estamento = @ret_estamento,
			ret_segmento = @ret_segmento,
			ret_dotacion = @ret_dotacion,
			ret_caja_destino = @ret_caja_destino,
			ejecutivo_rut = @ejecutivo_rut,
			oficina = @oficina
		WHERE ret_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabEmp_Retencion
		(
			empresa_id,
			ret_estamento,
			ret_segmento,
			ret_dotacion,
			ret_caja_destino,
			ejecutivo_rut,
			oficina
		)
		VALUES
		(
			@empresa_id,
			@ret_estamento,
			@ret_segmento,
			@ret_dotacion,
			@ret_caja_destino,
			@ejecutivo_rut,
			@oficina
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END