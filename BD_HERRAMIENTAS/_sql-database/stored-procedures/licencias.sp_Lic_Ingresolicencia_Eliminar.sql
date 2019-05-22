IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Ingresolicencia_Eliminar]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Ingresolicencia_Eliminar]
GO
CREATE PROCEDURE [licencias].[sp_Lic_Ingresolicencia_Eliminar]
(
	@Token varchar(50),
	@CodIngreso int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 28-09-2017 16:37:20
-- Tabla Principal        : TabLic_IngresoLicencia
-- Descripcion            : Guarda un registro en la tabla TabLic_IngresoLicencia
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @RUT_EJECUTIVO VARCHAR(50) = security.fnSca_ObtenerRutByToken(@Token)
	DECLARE @OFICINA INT = security.fnSca_ObtenerOficinaByToken(@Token)
	
	DELETE FROM licencias.TabLic_IngresoLicencia 
	WHERE CodIngreso = @CodIngreso

	
END