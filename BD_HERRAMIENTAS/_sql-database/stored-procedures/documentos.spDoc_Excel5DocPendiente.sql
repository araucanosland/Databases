IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[documentos].[spDoc_Excel5DocPendiente]') AND type = 'P')
DROP PROCEDURE [documentos].[spDoc_Excel5DocPendiente]
GO
CREATE PROCEDURE [documentos].[spDoc_Excel5DocPendiente]
  @RutEmpresa AS int ,
  @CodOficina AS int 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	--Select * 
	--From [serv-55].BD_ANALISIS.dbo.TabMotor_SIL9K_CMPETrab_Detalle
	--where Empresa_Rut = @RutEmpresa
	--and Oficina = @CodOficina

	SELECT 'EE'

END