IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Ambitosfidelizacion_Listar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Ambitosfidelizacion_Listar]
GO
CREATE PROCEDURE [empresas].[spEmp_Ambitosfidelizacion_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:48:29
-- Tabla Principal        : TabEmp_AmbitosFidelizacion
-- Descripcion            : Lista todos los registros de la tabla TabEmp_AmbitosFidelizacion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		afid_id,
		ambito_id,
		fidelizacion_id
	FROM
		TabEmp_AmbitosFidelizacion
END