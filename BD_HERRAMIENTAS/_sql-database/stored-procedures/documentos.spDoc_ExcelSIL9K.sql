IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[documentos].[spDoc_ExcelSIL9K]') AND type = 'P')
DROP PROCEDURE [documentos].[spDoc_ExcelSIL9K]
GO
CREATE PROCEDURE [documentos].[spDoc_ExcelSIL9K]
  @RutEmpresa AS int ,
  @CodOficina AS int 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

--Select 
-- Empresa_Rut
--,Empresa_Dv
--,Empresa_Nombre
--,Afiliado_Rut
--,Afiliado_Dv
--,Afiliado_Nombre
--,Cast(Left(Convert(varchar,DateAdd(m,6,Convert(date,Min(Licencia_FTermino))),112),6)  as varchar(20)) MesPrescripcion 
--,SolicitarDato1
--,SolicitarDato2
--,SolicitarDato3
--From [serv-55].BD_ANALISIS.dbo.TabMotor_CMP_SIL9K_Detalle A 
--Left Join (  Select Distinct Cod_Oficina,Oficina
--                    From [serv-55].BD_ODS.dbo.TabMae_Oficinas 
--       ) B
--On A.Oficina=B.Cod_Oficina
--Where Empresa_Rut=@RutEmpresa And A.Oficina=@CodOficina
--Group By 
-- Empresa_Rut
--,Empresa_Dv
--,Empresa_Nombre
--,Afiliado_Rut
--,Afiliado_Dv
--,Afiliado_Nombre
--,SolicitarDato1
--,SolicitarDato2
--,SolicitarDato3
--Order By Empresa_Rut,Afiliado_Rut
  select 'ERROR: PROCEDIMIENTO LLAMADO REMOTO'



END