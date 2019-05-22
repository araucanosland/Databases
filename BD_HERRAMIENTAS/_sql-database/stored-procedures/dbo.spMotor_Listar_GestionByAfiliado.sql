IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Listar_GestionByAfiliado]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Listar_GestionByAfiliado]
GO
CREATE PROCEDURE [dbo].[spMotor_Listar_GestionByAfiliado]
	@AfiliadoRut AS VARCHAR(20)
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	select b.* 
	from dbo.TabMotor_Asignacion a
	inner join dbo.TabMotor_Gestion b on a.id_Asign = b.ges_bcam_uid
	where a.Afiliado_Rut = @AfiliadoRut

END