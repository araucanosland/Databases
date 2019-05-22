IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[sp_Feriados_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [dbo].[sp_Feriados_ObtenerPorID]
GO
CREATE PROCEDURE [dbo].[sp_Feriados_ObtenerPorID]
(
	@Fecha date
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 28-08-2017 13:12:34
-- Tabla Principal        : TabMotor_Feriados
-- Descripcion            : Recupera un registro la TabMotor_Feriados dado un Fecha
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		Fecha,
		Descripcion
	FROM
		TabMotor_Feriados
	WHERE
		Fecha = @Fecha

END