IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Gestionretencion_Guardar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Gestionretencion_Guardar]
GO
CREATE PROCEDURE [empresas].[spEmp_Gestionretencion_Guardar]
(
	@gstr_id int,
	@gstr_fecha datetime,
	@gstr_etapa varchar(150),
	@gstr_observaciones varchar(100),
	@gstr_fecha_accion datetime,
	@retencion_id int,
	@ejecutivo_rut varchar(20),
	@oficina int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 10-04-2018 17:58:00
-- Tabla Principal        : TabEmp_GestionRetencion
-- Descripcion            : Guarda un registro en la tabla TabEmp_GestionRetencion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @gstr_id

	IF @identity > 0
	BEGIN
		UPDATE TabEmp_GestionRetencion SET 
			gstr_fecha = @gstr_fecha,
			gstr_etapa = @gstr_etapa,
			gstr_observaciones = @gstr_observaciones,
			gstr_fecha_accion = @gstr_fecha_accion,
			retencion_id = @retencion_id,
			ejecutivo_rut = @ejecutivo_rut,
			oficina = @oficina
		WHERE gstr_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabEmp_GestionRetencion
		(
			gstr_fecha,
			gstr_etapa,
			gstr_observaciones,
			gstr_fecha_accion,
			retencion_id,
			ejecutivo_rut,
			oficina
		)
		VALUES
		(
			@gstr_fecha,
			@gstr_etapa,
			@gstr_observaciones,
			@gstr_fecha_accion,
			@retencion_id,
			@ejecutivo_rut,
			@oficina
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END