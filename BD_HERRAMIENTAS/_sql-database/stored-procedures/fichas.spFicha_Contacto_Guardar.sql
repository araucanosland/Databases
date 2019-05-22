IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Contacto_Guardar]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Contacto_Guardar]
GO
CREATE PROCEDURE [fichas].[spFicha_Contacto_Guardar]
(
	@cnt_id int,
	@encabezado_id int,
	@nombre varchar(255),
	@telefono int,
	@email varchar(255),
	@direccion varchar(255),
	@compromisos varchar(255),
	@tipo varchar(50)
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 06-03-2018 17:49:35
-- Tabla Principal        : TabFicha_Contacto
-- Descripcion            : Guarda un registro en la tabla TabFicha_Contacto
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @cnt_id

	IF @identity > 0
	BEGIN
		UPDATE TabFicha_Contacto SET 
			encabezado_id = @encabezado_id,
			nombre = @nombre,
			telefono = @telefono,
			email = @email,
			direccion = @direccion,
			compromisos = @compromisos,
			tipo = @tipo
		WHERE cnt_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabFicha_Contacto
		(
			encabezado_id,
			nombre,
			telefono,
			email,
			direccion,
			compromisos,
			tipo
		)
		VALUES
		(
			@encabezado_id,
			@nombre,
			@telefono,
			@email,
			@direccion,
			@compromisos,
			@tipo
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END