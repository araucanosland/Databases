IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Asignacion_Rechazos_Listar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Asignacion_Rechazos_Listar]
GO
CREATE PROCEDURE [dbo].[spMotor_Asignacion_Rechazos_Listar](
	@Periodo INT,
	@AfiliadoRut INT,
	@EmpresaRut INT
)
AS
-- =============================================
-- Autor                  : Carlos Pradenas
-- Fecha de Creacion      : 15-12-2017 12:39 GMT-4 Chile
-- Tabla Principal        : dbo.TabMotor_Asignacion_Rechazos
-- Descripcion            : Lista todos los registros de la tabla dbo.TabMotor_Asignacion_Rechazos
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;
		
	SELECT *
	FROM dbo.TabMotor_Asignacion_Rechazos
	WHERE Afiliado_Rut = @AfiliadoRut
	AND Empresa_Rut = @EmpresaRut
	AND Periodo = @Periodo
	order by MotivoRechazo

END