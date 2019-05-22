IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_PreferenciaAfiliado_Listar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_PreferenciaAfiliado_Listar]
GO



CREATE PROCEDURE [dbo].[spMotor_PreferenciaAfiliado_Listar]
AS
-- =============================================
-- Autor                  : Charly
-- Fecha de Creacion      : 29-05-2017 17:46:41
-- Tabla Principal        : TabMotor_Preferencia_Afiliado
-- Descripcion            : Lista todos los registros de la tabla TabMotor_Preferencia_Afiliado
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
END