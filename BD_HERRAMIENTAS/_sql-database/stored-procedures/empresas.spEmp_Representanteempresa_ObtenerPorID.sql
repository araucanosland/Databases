IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Representanteempresa_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Representanteempresa_ObtenerPorID]
GO
CREATE PROCEDURE [empresas].[spEmp_Representanteempresa_ObtenerPorID]
(
	@rep_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:54:11
-- Tabla Principal        : TabEmp_RepresentanteEmpresa
-- Descripcion            : Recupera un registro la TabEmp_RepresentanteEmpresa dado un rep_id
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		rep_id,
		rep_nombre,
		rep_cargo,
		emp_id
	FROM
		TabEmp_RepresentanteEmpresa
	WHERE
		rep_id = @rep_id

END