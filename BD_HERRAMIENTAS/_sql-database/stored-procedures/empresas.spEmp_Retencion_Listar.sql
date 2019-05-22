IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Retencion_Listar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Retencion_Listar]
GO
CREATE PROCEDURE [empresas].[spEmp_Retencion_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 10-04-2018 17:57:23
-- Tabla Principal        : TabEmp_Retencion
-- Descripcion            : Lista todos los registros de la tabla TabEmp_Retencion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		ret_id,
		empresa_id,
		ret_estamento,
		ret_segmento,
		ret_dotacion,
		ret_caja_destino,
		ejecutivo_rut,
		oficina
	FROM
		TabEmp_Retencion
END