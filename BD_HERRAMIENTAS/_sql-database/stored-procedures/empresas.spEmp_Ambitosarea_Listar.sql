IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Ambitosarea_Listar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Ambitosarea_Listar]
GO
CREATE PROCEDURE [empresas].[spEmp_Ambitosarea_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:46:37
-- Tabla Principal        : TabEmp_AmbitosArea
-- Descripcion            : Lista todos los registros de la tabla TabEmp_AmbitosArea
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		ambito_id,
		ambito_nombre,
		area_id
	FROM
		TabEmp_AmbitosArea
END