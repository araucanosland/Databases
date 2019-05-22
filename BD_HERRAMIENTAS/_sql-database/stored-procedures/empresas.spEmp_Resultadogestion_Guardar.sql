IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Resultadogestion_Guardar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Resultadogestion_Guardar]
GO
CREATE PROCEDURE [empresas].[spEmp_Resultadogestion_Guardar]
(
	@resg_id int,
	@resg_tipo varchar(100),
	@resg_comentarios varchar(150),
	@resg_fecha date,
	@fidelizacion_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:55:23
-- Tabla Principal        : TabEmp_ResultadoGestion
-- Descripcion            : Guarda un registro en la tabla TabEmp_ResultadoGestion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @resg_id

	IF @identity > 0
	BEGIN
		UPDATE TabEmp_ResultadoGestion SET 
			resg_tipo = @resg_tipo,
			resg_comentarios = @resg_comentarios,
			resg_fecha = @resg_fecha,
			fidelizacion_id = @fidelizacion_id
		WHERE resg_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabEmp_ResultadoGestion
		(
			resg_tipo,
			resg_comentarios,
			resg_fecha,
			fidelizacion_id
		)
		VALUES
		(
			@resg_tipo,
			@resg_comentarios,
			@resg_fecha,
			@fidelizacion_id
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END