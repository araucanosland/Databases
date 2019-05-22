IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Ambitosretencion_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Ambitosretencion_ObtenerPorID]
GO
CREATE PROCEDURE [empresas].[spEmp_Ambitosretencion_ObtenerPorID]
(
	@aret_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 10-04-2018 17:56:12
-- Tabla Principal        : TabEmp_AmbitosRetencion
-- Descripcion            : Recupera un registro la TabEmp_AmbitosRetencion dado un aret_id
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		aret_id,
		ambito_id,
		retencion_id
	FROM
		TabEmp_AmbitosRetencion
	WHERE
		aret_id = @aret_id

END