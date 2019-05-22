IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Encabezado_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Encabezado_ObtenerPorID]
GO
CREATE PROCEDURE [fichas].[spFicha_Encabezado_ObtenerPorID]
(
	@enc_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:52:52
-- Tabla Principal        : TabFicha_Encabezado
-- Descripcion            : Recupera un registro la TabFicha_Encabezado dado un enc_id
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		enc_id,
		cuestionario_id,
		rut_empresa,
		estamento,
		nombre_funcionario,
		cargo_funcionario,
		cantidad_empleados,
		cod_sucursal,
		rut_ejecutivo,
		nombre_empresa,
		fecha_entrevista,
		fecha_actualizacion,
		nombre_sucursal_empresa
	FROM
		TabFicha_Encabezado
	WHERE
		enc_id = @enc_id

END