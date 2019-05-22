IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[documentos].[spDoc_ExcelSIL9K_DocPendiente]') AND type = 'P')
DROP PROCEDURE [documentos].[spDoc_ExcelSIL9K_DocPendiente]
GO
CREATE PROCEDURE [documentos].[spDoc_ExcelSIL9K_DocPendiente]
  @RutEmpresa AS int ,
  @CodOficina AS int 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	Select * ,Cast(Left(Convert(varchar,DateAdd(m,6,Convert(date,Licencia_FTermino)),112),6)  as varchar(20)) Mes_Prescripcion 
	From [serv-55].BD_MOTOR.lm.TabMotor_LM_DocumentacionPendiente
	where Empresa_Rut = @RutEmpresa
	and Oficina = @CodOficina

END