IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ListaPeriodos]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ListaPeriodos]
GO
CREATE PROCEDURE [dbo].[spMotor_ListaPeriodos]
(
	@TipoAsignacion INT
)
AS
-- =============================================
-- Autor                  : Charly
-- Fecha de Creacion      : 29-05-2017 17:45:02
-- Tabla Principal        : TabMotor_Preferencia_Afiliado
-- Descripcion            : Guarda un registro en la tabla TabMotor_Preferencia_Afiliado
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;
	SET LANGUAGE spanish;

	SELECT DISTINCT Periodo, 
				DATENAME(MONTH, CAST(CAST(Periodo AS VARCHAR(20)) + '01' AS DATE)) + ' ' + DATENAME(YEAR, CAST(CAST(Periodo AS VARCHAR(20)) + '01' AS DATE)) Periodo_Text
	FROM dbo.TabMotor_Asignacion	
	where TipoAsignacion = @TipoAsignacion
	ORDER BY Periodo desc

END