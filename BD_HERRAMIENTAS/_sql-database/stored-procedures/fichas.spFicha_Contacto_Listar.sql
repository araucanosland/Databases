IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Contacto_Listar]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Contacto_Listar]
GO
CREATE PROCEDURE [fichas].[spFicha_Contacto_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:50:37
-- Tabla Principal        : TabFicha_Contacto
-- Descripcion            : Lista todos los registros de la tabla TabFicha_Contacto
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
END