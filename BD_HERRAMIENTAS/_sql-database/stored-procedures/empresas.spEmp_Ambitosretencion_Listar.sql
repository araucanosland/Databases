IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Ambitosretencion_Listar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Ambitosretencion_Listar]
GO
CREATE PROCEDURE [empresas].[spEmp_Ambitosretencion_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 10-04-2018 17:56:24
-- Tabla Principal        : TabEmp_AmbitosRetencion
-- Descripcion            : Lista todos los registros de la tabla TabEmp_AmbitosRetencion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		aret_id,
		ambito_id,
		retencion_id
	FROM
		TabEmp_AmbitosRetencion
END