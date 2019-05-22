IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Filtrosrsg_Listar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Filtrosrsg_Listar]
GO
CREATE PROCEDURE [dbo].[spMotor_Filtrosrsg_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 31-08-2017 11:34:45
-- Tabla Principal        : TabMotor_FiltrosRSG
-- Descripcion            : Lista todos los registros de la tabla TabMotor_FiltrosRSG
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
END