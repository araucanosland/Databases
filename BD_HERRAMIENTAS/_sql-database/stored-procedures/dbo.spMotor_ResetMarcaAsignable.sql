IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ResetMarcaAsignable]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ResetMarcaAsignable]
GO
CREATE PROCEDURE [dbo].[spMotor_ResetMarcaAsignable]
(
	@Periodo int,
	@Oficina int
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

	DECLARE @P INT = @Periodo
	


	update TabMotor_Dotacion
	set EsAsignable = 0
	where Periodo = @P
	and Cod_Sucursal = @Oficina

END