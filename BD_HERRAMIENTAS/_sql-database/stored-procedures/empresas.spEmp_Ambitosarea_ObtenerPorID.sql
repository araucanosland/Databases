IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Ambitosarea_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Ambitosarea_ObtenerPorID]
GO
CREATE PROCEDURE [empresas].[spEmp_Ambitosarea_ObtenerPorID]
(
	@ambito_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-04-2018 11:07:02
-- Tabla Principal        : TabEmp_AmbitosArea
-- Descripcion            : Recupera un registro la TabEmp_AmbitosArea dado un ambito_id
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
	WHERE
		ambito_id = @ambito_id

END