IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Empresa_Guardar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Empresa_Guardar]
GO
CREATE PROCEDURE [empresas].[spEmp_Empresa_Guardar]
(
	@emp_id int,
	@emp_rut varchar(50),
	@emp_nombre varchar(255) = null,
	@emp_holding varchar(255) = null
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:50:17
-- Tabla Principal        : TabEmp_Empresa
-- Descripcion            : Guarda un registro en la tabla TabEmp_Empresa
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @emp_id

	IF @identity > 0
	BEGIN
		UPDATE TabEmp_Empresa SET 
			emp_rut = @emp_rut,
			emp_nombre = @emp_nombre,
			emp_holding = @emp_holding
		WHERE emp_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabEmp_Empresa
		(
			emp_rut,
			emp_nombre,
			emp_holding
		)
		VALUES
		(
			@emp_rut,
			@emp_nombre,
			@emp_holding
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END