IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Filtrosrsg_Obtener]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Filtrosrsg_Obtener]
GO
CREATE PROCEDURE [dbo].[spMotor_Filtrosrsg_Obtener]
(
	@Periodo int,
	@RutAfiliado varchar(20),
	@RutEmpresa varchar(20)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 31-08-2017 11:39:20
-- Tabla Principal        : TabMotor_FiltrosRSG
-- Descripcion            : Recupera un registro la TabMotor_FiltrosRSG dado un Periodo
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	SELECT
		Periodo,
		AfiliadoRut,
		EmpresaRut,
		Filtros
	FROM
		TabMotor_FiltrosRSG
	WHERE
		Periodo = @Periodo
	AND AfiliadoRut = @RutAfiliado
	AND EmpresaRut = @RutEmpresa
		
END