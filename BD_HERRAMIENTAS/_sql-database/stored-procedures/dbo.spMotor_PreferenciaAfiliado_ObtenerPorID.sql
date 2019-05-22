IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_PreferenciaAfiliado_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_PreferenciaAfiliado_ObtenerPorID]
GO
CREATE PROCEDURE [dbo].[spMotor_PreferenciaAfiliado_ObtenerPorID]
(
	@Afiliado_rut int,
	@Tipo_preferencia VARCHAR(50)
)
AS
-- =============================================
-- Autor                  : Charly
-- Fecha de Creacion      : 29-05-2017 17:45:30
-- Tabla Principal        : TabMotor_Preferencia_Afiliado
-- Descripcion            : Recupera un registro la TabMotor_Preferencia_Afiliado dado un Afiliado_rut
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
		Tipo_preferencia,
		Valor_preferencia,
		Valida
	FROM
		TabMotor_Preferencia_Afiliado
	WHERE
		Afiliado_rut = @Afiliado_rut
	AND	
		Tipo_preferencia = @Tipo_preferencia
		

END