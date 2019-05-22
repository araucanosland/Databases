IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Gestion_Guardar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Gestion_Guardar]
GO
CREATE PROCEDURE [dbo].[spMotor_Gestion_Guardar]
(
	@ges_bcam_uid int,
	@ges_fecha_accion varchar(255),
	@ges_fecha_compromete varchar(255),
	@ges_estado_gst varchar(255),
	@ges_descripcion_gst varchar(255),
	@ges_ejecutivo_rut varchar(255),
	@ges_oficina varchar(255)
)
AS
-- =============================================
-- Autor                  : Carlos Pradenas
-- Fecha de Creacion      : 12-04-2017 17:59:27
-- Tabla Principal        : TabMotor_Gestion
-- Descripcion            : Guarda un registro en la tabla TabMotor_Gestion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	
		UPDATE A
		set TipoDerivacion = 'ESPONTANEA', Oficina = @ges_oficina 
		From TabMotor_Asignacion A with(index(idx_guardaGestion))
		where id_Asign = @ges_bcam_uid 
		and TipoDerivacion = '' 
		and TipoAsignacion = 5
		and @ges_estado_gst not in (701,702)
		and @ges_oficina <> 555
		

		UPDATE A
		set TipoDerivacion = 'ESPONTANEA'
		From TabMotor_Asignacion  A with(index(idx_guardaGestion))
		where id_Asign = @ges_bcam_uid 
		and TipoDerivacion = '' 
		and TipoAsignacion = 1
		and @ges_estado_gst in (301,302,303,304,403)


		UPDATE A 
		set TipoDerivacion = 'CALL'
		From TabMotor_Asignacion  A with(index(idx_guardaGestion))
		where id_Asign = @ges_bcam_uid 
		and TipoDerivacion in ('','WEB') 
		and TipoAsignacion in (1,5)
		and @ges_oficina = 555
	

	if @ges_oficina = 555 
	BEGIN
		insert into dbo.TabMotor_LogDerivacion (ejecutivo_derivacion,fecha_accion,id_asignacion)
		values (@ges_ejecutivo_rut,GETDATE(), @ges_bcam_uid)

	END

	
		INSERT INTO TabMotor_Gestion
		(
			ges_bcam_uid,
			ges_fecha_accion,
			ges_fecha_compromete,
			ges_estado_gst,
			ges_descripcion_gst,
			ges_ejecutivo_rut,
			ges_oficina
		)
		VALUES
		(
			@ges_bcam_uid,
			GETDATE(),
			@ges_fecha_compromete,
			@ges_estado_gst,
			@ges_descripcion_gst,
			@ges_ejecutivo_rut,
			@ges_oficina
		)	

		select @ges_bcam_uid;

END