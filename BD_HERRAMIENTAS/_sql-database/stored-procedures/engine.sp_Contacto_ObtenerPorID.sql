IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Contacto_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Contacto_ObtenerPorID]
GO
CREATE PROCEDURE [engine].[sp_Contacto_ObtenerPorID]
(
	@CodContacto bigint
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 05-09-2017 15:39:24
-- Tabla Principal        : Contacto
-- Descripcion            : Recupera un registro la Contacto dado un CodContacto
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		CodTipoEntidad,
		RutEntidad,
		CodCategoria,
		CodTipo,
		ValorContacto,
		CodContacto
	FROM
		Contacto
	WHERE
		CodContacto = @CodContacto

END