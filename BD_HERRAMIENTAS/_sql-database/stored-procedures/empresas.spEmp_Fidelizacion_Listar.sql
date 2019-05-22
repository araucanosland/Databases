IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Fidelizacion_Listar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Fidelizacion_Listar]
GO
CREATE PROCEDURE [empresas].[spEmp_Fidelizacion_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:52:02
-- Tabla Principal        : TabEmp_Fidelizacion
-- Descripcion            : Lista todos los registros de la tabla TabEmp_Fidelizacion
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
END