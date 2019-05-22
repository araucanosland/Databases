IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Desarrollo_Listar]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Desarrollo_Listar]
GO
CREATE PROCEDURE [fichas].[spFicha_Desarrollo_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:52:35
-- Tabla Principal        : TabFicha_Desarrollo
-- Descripcion            : Lista todos los registros de la tabla TabFicha_Desarrollo
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		desa_id,
		encabezado_id,
		respuesta_id,
		texto
	FROM
		TabFicha_Desarrollo
END