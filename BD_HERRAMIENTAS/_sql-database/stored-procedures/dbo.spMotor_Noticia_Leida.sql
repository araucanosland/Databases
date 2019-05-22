IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Noticia_Leida]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Noticia_Leida]
GO

CREATE PROCEDURE [dbo].[spMotor_Noticia_Leida]
(
	@token VARCHAR(100)
)
AS
-- =============================================
-- Autor                  : Charly
-- Fecha de Creacion      : 12-06-2017 10:26:50
-- Tabla Principal        : TabMotor_Noticia
-- Descripcion            : Lista todos los registros de la tabla TabMotor_Noticia
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	
	UPDATE security.TabSca_Usuario 
	SET usr_noticia_inicio = 0
	WHERE usr_rut = security.fnSca_ObtenerRutByToken(@token)

END