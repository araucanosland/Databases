IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Contactoafiliado_Guardar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Contactoafiliado_Guardar]
GO
CREATE PROCEDURE [dbo].[spMotor_Contactoafiliado_Guardar]
(
	@Afiliado_rut int,
	@Fecha_accion datetime,
	@Tipo_contacto varchar(255),
	@Valor_contacto varchar(255),
	@Valido tinyint
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 04-05-2017 18:31:58
-- Tabla Principal        : TabMotor_ContactoAfiliado
-- Descripcion            : Guarda un registro en la tabla TabMotor_ContactoAfiliado
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
--	select * from TabMotor_Contacto_Afiliado
BEGIN

	SET NOCOUNT ON;

	DECLARE @existe int

	select @existe = count(*) 
	from TabMotor_Contacto_Afiliado 
	where Afiliado_rut = @Afiliado_rut 
	and  Valor_contacto = @Valor_contacto 
	and Tipo_contacto = @Tipo_contacto


	IF (@existe > 0) 
	BEGIN
		UPDATE TabMotor_Contacto_Afiliado SET 
			Afiliado_rut = @Afiliado_rut,
			Fecha_accion = @Fecha_accion,
			Tipo_contacto = @Tipo_contacto,
			Valor_contacto = @Valor_contacto,
			Valido = @Valido,
			Fecha_contacto = GETDATE()
		WHERE Afiliado_rut = @Afiliado_rut and  Valor_contacto = @Valor_contacto and Tipo_contacto = @Tipo_contacto
	END
	ELSE
	BEGIN
		INSERT INTO TabMotor_Contacto_Afiliado
		(
			Afiliado_rut,
			Fecha_accion,
			Tipo_contacto,
			Valor_contacto,
			Valido,
			Fecha_contacto
		)
		VALUES
		(
			@Afiliado_rut,
			@Fecha_accion,
			@Tipo_contacto,
			@Valor_contacto,
			@Valido,
			GETDATE()
		)

		--SELECT @identity = SCOPE_IDENTITY()
	END

	--SELECT @identity
END