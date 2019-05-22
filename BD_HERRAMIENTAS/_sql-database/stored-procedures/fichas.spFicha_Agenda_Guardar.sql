IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Agenda_Guardar]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Agenda_Guardar]
GO
CREATE PROCEDURE [fichas].[spFicha_Agenda_Guardar]
(
	@age_id int,
	@encabezado_id int,
	@fecha date,
	@estamento varchar(100),
	@nombre_funcionario varchar(200),
	@cargo_funcionario varchar(200)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 15-03-2018 10:02:58
-- Tabla Principal        : TabFicha_Agenda
-- Descripcion            : Guarda un registro en la tabla TabFicha_Agenda
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @age_id

	IF @identity > 0
	BEGIN
		UPDATE TabFicha_Agenda SET 
			encabezado_id = @encabezado_id,
			fecha = @fecha,
			estamento = @estamento,
			nombre_funcionario = @nombre_funcionario,
			cargo_funcionario = @cargo_funcionario
		WHERE age_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabFicha_Agenda
		(
			encabezado_id,
			fecha,
			estamento,
			nombre_funcionario,
			cargo_funcionario
		)
		VALUES
		(
			@encabezado_id,
			@fecha,
			@estamento,
			@nombre_funcionario,
			@cargo_funcionario
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END