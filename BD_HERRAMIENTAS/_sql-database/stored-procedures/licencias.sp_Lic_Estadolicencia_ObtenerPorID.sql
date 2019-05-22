IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Estadolicencia_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Estadolicencia_ObtenerPorID]
GO
CREATE PROCEDURE [licencias].[sp_Lic_Estadolicencia_ObtenerPorID]
(
	@CodEstado int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 28-09-2017 16:36:14
-- Tabla Principal        : TabLic_EstadoLicencia
-- Descripcion            : Recupera un registro la TabLic_EstadoLicencia dado un CodEstado
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		CodEstado,
		Nombre
	FROM
		TabLic_EstadoLicencia
	WHERE
		CodEstado = @CodEstado

END