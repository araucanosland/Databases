IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Ausencia_ListarMes]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Ausencia_ListarMes]
GO


CREATE PROCEDURE [dbo].[spMotor_Ausencia_ListarMes]
(
@Periodo INT,
@RutEjec VARCHAR(50)
)
AS
-- =============================================
-- Autor                  : Carlos Pradenas
-- Fecha de Creacion      : 28-06-2017 00:01:03
-- Tabla Principal        : TabMotor_Ausencia
-- Descripcion            : Lista todos los registros de la tabla TabMotor_Ausencia
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		TabMotor_Ausencia.aus_id,
		TabMotor_Ausencia.ejec_rut,
		TabMotor_Ausencia.aus_fecha_inicio,
		TabMotor_Ausencia.aus_fecha_fin,
		TabMotor_Ausencia.tipo_ausencia_id,
		TabMotor_Ausencia.aus_cantidad_dias,
		TabMotor_Ausencia.aus_comentarios,
		TabMotor_Ausencia.aus_marca_ausencia
	FROM
		TabMotor_Ausencia
	inner join TabMotor_Dotacion on TabMotor_Ausencia.ejec_rut = TabMotor_Dotacion.Rut and TabMotor_Dotacion.Periodo = @Periodo
	WHERE LEFT(REPLACE(CONVERT(DATE,TabMotor_Ausencia.aus_fecha_inicio),'-',''),6) <= @Periodo
	AND TabMotor_Ausencia.ejec_rut = @RutEjec


END