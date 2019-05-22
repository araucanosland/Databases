IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Encabezado_Listar]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Encabezado_Listar]
GO
CREATE PROCEDURE [fichas].[spFicha_Encabezado_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:53:00
-- Tabla Principal        : TabFicha_Encabezado
-- Descripcion            : Lista todos los registros de la tabla TabFicha_Encabezado
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
END