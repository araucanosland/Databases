IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Gestionprospeccion_Guardar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Gestionprospeccion_Guardar]
GO
CREATE PROCEDURE [empresas].[spEmp_Gestionprospeccion_Guardar]
(
	@gstp_id int,
	@gstp_fecha datetime,
	@gstp_etapa varchar(150),
	@gstp_observaciones varchar(100),
	@gstp_fecha_accion datetime,
	@prospecto_id int,
	@ejecutivo_rut varchar(20),
	@oficina int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-04-2018 14:14:48
-- Tabla Principal        : TabEmp_GestionProspeccion
-- Descripcion            : Guarda un registro en la tabla TabEmp_GestionProspeccion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @gstp_id

	IF @identity > 0
	BEGIN
		UPDATE TabEmp_GestionProspeccion SET 
			gstp_fecha = @gstp_fecha,
			gstp_etapa = @gstp_etapa,
			gstp_observaciones = @gstp_observaciones,
			gstp_fecha_accion = @gstp_fecha_accion,
			prospecto_id = @prospecto_id,
			ejecutivo_rut = @ejecutivo_rut,
			oficina = @oficina
		WHERE gstp_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabEmp_GestionProspeccion
		(
			gstp_fecha,
			gstp_etapa,
			gstp_observaciones,
			gstp_fecha_accion,
			prospecto_id,
			ejecutivo_rut,
			oficina
		)
		VALUES
		(
			@gstp_fecha,
			@gstp_etapa,
			@gstp_observaciones,
			@gstp_fecha_accion,
			@prospecto_id,
			@ejecutivo_rut,
			@oficina
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END