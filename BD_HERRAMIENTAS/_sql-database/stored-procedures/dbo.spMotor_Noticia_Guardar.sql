IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Noticia_Guardar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Noticia_Guardar]
GO

CREATE PROCEDURE [dbo].[spMotor_Noticia_Guardar]
(
	@noti_id int,
	@noti_titulo varchar(255),
	@noti_cuerpo varchar(255),
	@noti_cerrable int
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

	DECLARE @identity int

	SET @identity = @noti_id

	IF @identity > 0
	BEGIN
		UPDATE TabMotor_Noticia SET 
			noti_id = @noti_id,
			noti_titulo = @noti_titulo,
			noti_cuerpo = @noti_cuerpo,
			noti_cerrable = @noti_cerrable,
			noti_fecha = GETDATE()
		WHERE noti_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabMotor_Noticia
		(
			noti_id,
			noti_titulo,
			noti_cuerpo,
			noti_cerrable,
			noti_fecha
		)
		VALUES
		(
			@noti_id,
			@noti_titulo,
			@noti_cuerpo,
			@noti_cerrable,
			GETDATE()
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END