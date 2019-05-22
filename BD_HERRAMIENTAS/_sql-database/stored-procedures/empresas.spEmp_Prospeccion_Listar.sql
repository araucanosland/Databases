IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Prospeccion_Listar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Prospeccion_Listar]
GO
CREATE PROCEDURE [empresas].[spEmp_Prospeccion_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 12-04-2018 14:16:16
-- Tabla Principal        : TabEmp_Prospeccion
-- Descripcion            : Lista todos los registros de la tabla TabEmp_Prospeccion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		pros_id,
		empresa_id,
		pros_dotacion,
		pros_caja_origen,
		ejecutivo_rut,
		oficina
	FROM
		TabEmp_Prospeccion
END