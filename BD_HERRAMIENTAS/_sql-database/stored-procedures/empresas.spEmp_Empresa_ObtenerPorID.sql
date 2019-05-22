IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Empresa_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Empresa_ObtenerPorID]
GO
CREATE PROCEDURE [empresas].[spEmp_Empresa_ObtenerPorID]
(
	@emp_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:50:39
-- Tabla Principal        : TabEmp_Empresa
-- Descripcion            : Recupera un registro la TabEmp_Empresa dado un emp_id
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		emp_id,
		emp_rut,
		emp_nombre,
		emp_holding
	FROM
		TabEmp_Empresa
	WHERE
		emp_id = @emp_id

END