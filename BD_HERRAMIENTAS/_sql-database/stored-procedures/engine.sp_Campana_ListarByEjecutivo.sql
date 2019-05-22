IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Campana_ListarByEjecutivo]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Campana_ListarByEjecutivo]
GO
CREATE PROCEDURE [engine].[sp_Campana_ListarByEjecutivo]
(
	@RutEjecutivo VARCHAR(50)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:31:54
-- Tabla Principal        : Campaña
-- Descripcion            : Lista todos los registros de la tabla Campaña
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

	SELECT DISTINCT
		a.CodCamp,
		a.IdentidadCamp,
		a.Activa
	FROM Campaña a
	INNER JOIN Asignacion b on a.CodCamp = b.CodCamp
	WHERE (
			(b.RutEjecutivo <> '0' and b.RutEjecutivo = @rter)
		or	(b.RutEjecutivo <> '0' and charindex('{',b.RutEjecutivo) > -1 and @cargo in (select StringValue from generales.parseJSON(b.RutEjecutivo) where NAME = 'cargo') and CodOficina = @oficina)
		or 	(b.RutEjecutivo = '0' and CodOficina = @oficina)	

	)
	

	AND a.Activa = 1

END