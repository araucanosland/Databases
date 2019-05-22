IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Asignacion_ListarByEjecutivo]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Asignacion_ListarByEjecutivo]
GO
CREATE PROCEDURE [engine].[sp_Asignacion_ListarByEjecutivo]
(
	@CodCamp INT,
	@RutEjecutivo VARCHAR(50)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:14:52
-- Tabla Principal        : Asignacion
-- Descripcion            : Lista todos los registros de la tabla Asignacion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	DECLARE @rter VARCHAR(20) = [security].[fnSca_ObtenerRutByToken](@RutEjecutivo);
	DECLARE @oficina INT = [security].[fnSca_ObtenerOficinaByToken](@RutEjecutivo);
DECLARE @cargo VARCHAR(100) = [security].[fnSca_ObtenerCargoByToken](@RutEjecutivo);

	SELECT
		CodAsignacion,
		CodCamp,
		RutEntidad,
		RutEjecutivo
	FROM
		Asignacion
	WHERE CodCamp = @CodCamp
	--AND ((RutEjecutivo <> '0' and RutEjecutivo = @rter) or (RutEjecutivo = '0' and CodOficina = @oficina))
AND (
			(RutEjecutivo <> '0' and RutEjecutivo = @rter)
	or	(RutEjecutivo <> '0' and charindex('{',RutEjecutivo) > -1 and @cargo in (select StringValue from generales.parseJSON(RutEjecutivo) where NAME = 'cargo') and CodOficina = @oficina)
	or 	(RutEjecutivo = '0' and CodOficina = @oficina)

	)	


	AND Activa=1
END