IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[spEmp_Representanteempresa_Guardar]') AND type = 'P')
DROP PROCEDURE [empresas].[spEmp_Representanteempresa_Guardar]
GO
CREATE PROCEDURE [empresas].[spEmp_Representanteempresa_Guardar]
(
	@rep_id int,
	@rep_nombre varchar(255),
	@rep_cargo varchar(255),
	@emp_id int
)
AS
-- =============================================
-- Autor                  : @Charly
-- Fecha de Creacion      : 02-04-2018 12:52:32
-- Tabla Principal        : TabEmp_RepresentanteEmpresa
-- Descripcion            : Guarda un registro en la tabla TabEmp_RepresentanteEmpresa
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @rep_id

	IF @identity > 0
	BEGIN
		UPDATE TabEmp_RepresentanteEmpresa SET 
			rep_nombre = @rep_nombre,
			rep_cargo = @rep_cargo,
			emp_id = @emp_id
		WHERE rep_id = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabEmp_RepresentanteEmpresa
		(
			rep_nombre,
			rep_cargo,
			emp_id
		)
		VALUES
		(
			@rep_nombre,
			@rep_cargo,
			@emp_id
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END