IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Ambitosfidelizacion_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Ambitosfidelizacion_ObtenerPorID]
GO
CREATE PROCEDURE [empresas].[spEmp_Ambitosfidelizacion_ObtenerPorID]
(
	@afid_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:49:32
-- Tabla Principal        : TabEmp_AmbitosFidelizacion
-- Descripcion            : Recupera un registro la TabEmp_AmbitosFidelizacion dado un afid_id
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
	WHERE
		afid_id = @afid_id

END