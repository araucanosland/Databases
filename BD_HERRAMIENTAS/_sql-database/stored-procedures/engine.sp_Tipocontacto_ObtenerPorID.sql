IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Tipocontacto_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Tipocontacto_ObtenerPorID]
GO
CREATE PROCEDURE [engine].[sp_Tipocontacto_ObtenerPorID]
(
	@CodTipo int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:41:06
-- Tabla Principal        : TipoContacto
-- Descripcion            : Recupera un registro la TipoContacto dado un CodTipo
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		CodTipo,
		NombreTipo
	FROM
		TipoContacto
	WHERE
		CodTipo = @CodTipo

END