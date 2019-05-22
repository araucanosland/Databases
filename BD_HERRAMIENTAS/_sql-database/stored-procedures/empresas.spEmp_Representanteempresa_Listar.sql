IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Representanteempresa_Listar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Representanteempresa_Listar]
GO
CREATE PROCEDURE [empresas].[spEmp_Representanteempresa_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:55:07
-- Tabla Principal        : TabEmp_RepresentanteEmpresa
-- Descripcion            : Lista todos los registros de la tabla TabEmp_RepresentanteEmpresa
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
END