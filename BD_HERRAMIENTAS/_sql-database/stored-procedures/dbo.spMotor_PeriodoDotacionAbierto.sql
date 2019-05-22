IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_PeriodoDotacionAbierto]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_PeriodoDotacionAbierto]
GO
CREATE PROCEDURE [dbo].[spMotor_PeriodoDotacionAbierto]
(
@Periodo int
)
AS
-- =============================================
-- Autor                  : Charly
-- Fecha de Creacion      : 12-06-2017 10:18:15
-- Tabla Principal        : TabMotor_Noticia
-- Descripcion            : Guarda un registro en la tabla TabMotor_Noticia
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	select count(1) Salida
	from dbo.TabMotor_PeriodoAsignacionDotacion
	where GETDATE() BETWEEN FechaInicio and FechaFin
	and PeriodoAbierto = 1
	and Periodo = @Periodo

END