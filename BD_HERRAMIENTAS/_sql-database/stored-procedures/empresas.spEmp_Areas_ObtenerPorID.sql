IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Areas_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Areas_ObtenerPorID]
GO
CREATE PROCEDURE [empresas].[spEmp_Areas_ObtenerPorID]
(
	@area_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-04-2018 11:07:37
-- Tabla Principal        : TabEmp_Areas
-- Descripcion            : Recupera un registro la TabEmp_Areas dado un area_id
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
	WHERE
		area_id = @area_id

END