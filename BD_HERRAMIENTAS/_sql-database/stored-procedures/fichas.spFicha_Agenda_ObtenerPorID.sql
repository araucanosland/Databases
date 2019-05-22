IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Agenda_ObtenerPorID]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Agenda_ObtenerPorID]
GO
CREATE PROCEDURE [fichas].[spFicha_Agenda_ObtenerPorID]
(
	@age_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 15-03-2018 10:03:11
-- Tabla Principal        : TabFicha_Agenda
-- Descripcion            : Recupera un registro la TabFicha_Agenda dado un age_id
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
	WHERE
		age_id = @age_id

END