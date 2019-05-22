IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Empresa_Listar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Empresa_Listar]
GO
CREATE PROCEDURE [empresas].[spEmp_Empresa_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:50:53
-- Tabla Principal        : TabEmp_Empresa
-- Descripcion            : Lista todos los registros de la tabla TabEmp_Empresa
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
END