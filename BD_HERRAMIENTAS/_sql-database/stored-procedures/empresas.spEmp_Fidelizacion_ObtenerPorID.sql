IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Fidelizacion_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Fidelizacion_ObtenerPorID]
GO
CREATE PROCEDURE [empresas].[spEmp_Fidelizacion_ObtenerPorID]
(
	@fide_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:51:47
-- Tabla Principal        : TabEmp_Fidelizacion
-- Descripcion            : Recupera un registro la TabEmp_Fidelizacion dado un fide_id
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		fide_id,
		fide_estamento,
		fide_actividad,
		fide_cobertura,
		fide_fecha_calendario,
		fide_fecha_accion,
		representante_id,
		cod_oficina,
		rut_ejecutivo
	FROM
		TabEmp_Fidelizacion
	WHERE
		fide_id = @fide_id

END