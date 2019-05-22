IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Nuberespuestas_Guardar]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Nuberespuestas_Guardar]
GO
CREATE PROCEDURE [fichas].[spFicha_Nuberespuestas_Guardar]
(
	@nresp_id int,
	@despriccion varchar(255),
	@valor varchar(255),
	@tag varchar(50)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:53:14
-- Tabla Principal        : TabFicha_NubeRespuestas
-- Descripcion            : Guarda un registro en la tabla TabFicha_NubeRespuestas
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @nresp_id

	IF @identity > 0
	BEGIN
		UPDATE TabFicha_NubeRespuestas SET 
			despriccion = @despriccion,
			valor = @valor,
			tag = @tag
		WHERE nresp_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabFicha_NubeRespuestas
		(
			despriccion,
			valor,
			tag
		)
		VALUES
		(
			@despriccion,
			@valor,
			@tag
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END