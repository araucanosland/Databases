IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Contactoafiliado_ObtenerUnico]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Contactoafiliado_ObtenerUnico]
GO
CREATE PROCEDURE [dbo].[spMotor_Contactoafiliado_ObtenerUnico]
(
	@Afiliado_rut int,
	@Valor varchar(100)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 04-05-2017 18:32:56
-- Tabla Principal        : TabMotor_ContactoAfiliado
-- Descripcion            : Recupera un registro la TabMotor_ContactoAfiliado dado un Afiliado_rut
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		Afiliado_rut,
		Fecha_accion,
		Tipo_contacto,
		Valor_contacto,
		Valido,
		Fecha_contacto
	FROM
		TabMotor_Contacto_Afiliado
	WHERE
		Afiliado_rut = @Afiliado_rut
	AND 
		(Valor_contacto = @Valor or Valor_contacto = '+' + @Valor)




END