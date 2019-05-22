IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Contacto_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Contacto_ObtenerPorID]
GO
CREATE PROCEDURE [fichas].[spFicha_Contacto_ObtenerPorID]
(
	@cnt_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:49:59
-- Tabla Principal        : TabFicha_Contacto
-- Descripcion            : Recupera un registro la TabFicha_Contacto dado un cnt_id
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		cnt_id,
		encabezado_id,
		nombre,
		telefono,
		email,
		direccion,
		compromisos,
		tipo
	FROM
		TabFicha_Contacto
	WHERE
		cnt_id = @cnt_id

END