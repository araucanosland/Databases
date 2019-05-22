IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[fichas].[spFicha_Encabezado_GuardarNombre]') AND type = 'P')
DROP PROCEDURE [fichas].[spFicha_Encabezado_GuardarNombre]
GO
CREATE PROCEDURE [fichas].[spFicha_Encabezado_GuardarNombre](

	@enc_id int,
	@nombre_empresa VARCHAR(150)
)
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

		UPDATE TabFicha_Encabezado SET 
			nombre_empresa = @nombre_empresa
			
		WHERE enc_id = @enc_id


END