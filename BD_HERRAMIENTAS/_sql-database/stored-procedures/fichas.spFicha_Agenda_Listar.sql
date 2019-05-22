IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Agenda_Listar]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Agenda_Listar]
GO
CREATE PROCEDURE [fichas].[spFicha_Agenda_Listar]
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 15-03-2018 10:03:21
-- Tabla Principal        : TabFicha_Agenda
-- Descripcion            : Lista todos los registros de la tabla TabFicha_Agenda
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN
	SET NOCOUNT ON;

	SELECT
		age_id,
		encabezado_id,
		fecha,
		estamento,
		nombre_funcionario,
		cargo_funcionario
	FROM
		TabFicha_Agenda
END