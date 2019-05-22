IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Areas_Listar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Areas_Listar]
GO
CREATE PROCEDURE [empresas].[spEmp_Areas_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:49:58
-- Tabla Principal        : TabEmp_Areas
-- Descripcion            : Lista todos los registros de la tabla TabEmp_Areas
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		area_id,
		area_nombre
	FROM
		TabEmp_Areas
END