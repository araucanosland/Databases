IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Elimina_Empresa]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Elimina_Empresa]
GO
create PROCEDURE [carteras].[spMotorCartera_Elimina_Empresa] 
 @IdSucursalEmpresa VARCHAR(50)
,@RutEmpresa VARCHAR(50)
,@Token VARCHAR(50)
AS
BEGIN

--exec [carteras].[spMotorCartera_Elimina_Empresa] '', '', '' 


DECLARE @OFICINA VARCHAR(150) = security.fnSca_ObtenerOficinaByToken(@Token)


--------------------------------------------------------------------------------
--ELIMINA EJECUTIVOS ASIGNADOS A ANEXOS DE EMPRESA
--------------------------------------------------------------------------------

--SELECT TOP 1000 [IDEJECASIGANEXO]
--      ,[IDEMPRESAANEXO]
--      ,[RUTEJECUTIVOASIGANEXO]
--      ,[FECHAASIGNACION]
DELETE FROM [BD_HERRAMIENTAS].[CARTERAS].[TABCART_EJECASIGANEXO]
WHERE IDEMPRESAANEXO IN (SELECT  [IDEMPRESAANEXO]
						  --,[RUTEMPRESA]
						  --,[NOMBREEMPRESA]
						  --,[ANEXO]
						  --,[NUMTRABAJADORES]
						  --,[CODOFICINA]
						  --,[IDCOMUNA]
						  --,[NOMBRECOMUNA]
						  --,[DIRECCION]
						  --,[RUTAGENTEINGRESO]
						  --,[FECHACREACION]
						  --,[ESMATRIZ]
  FROM [BD_HERRAMIENTAS].[CARTERAS].[TABCART_ANEXOEMPRESA] WHERE [RUTEMPRESA] = @RUTEMPRESA AND [CODOFICINA] = @OFICINA)


--------------------------------------------------------------------------------
--ELIMINA ANEXOS DE EMPRESAS
--------------------------------------------------------------------------------


--SELECT  [IDEMPRESAANEXO]
--						  --,[RUTEMPRESA]
--						  --,[NOMBREEMPRESA]
--						  --,[ANEXO]
--						  --,[NUMTRABAJADORES]
--						  --,[CODOFICINA]
--						  --,[IDCOMUNA]
--						  --,[NOMBRECOMUNA]
--						  --,[DIRECCION]
--						  --,[RUTAGENTEINGRESO]
--						  --,[FECHACREACION]
--						  --,[ESMATRIZ]
  DELETE FROM [BD_HERRAMIENTAS].[CARTERAS].[TABCART_ANEXOEMPRESA] WHERE [RUTEMPRESA] = @RUTEMPRESA AND [CODOFICINA] = @OFICINA

--------------------------------------------------------------------------------
--ELIMINA CARTERA EMPRESAS
--------------------------------------------------------------------------------


--SELECT TOP 1000 [IDSUCURSALEMPRESA]
--      ,[RUTEMPRESA]
--      ,[NOMBREEMPRESA]
--      ,[CODOFICINA]
--      ,[NTRABAJADOR]
--      ,[HOLDING]
--      ,[EJECUTIVOINGRESO]
--      ,[TIPOEMPRESA]
--      ,[ID_EMPRESAADMIN]
      
  DELETE    
  FROM [BD_HERRAMIENTAS].[CARTERAS].[TABCART_CARTERAEMPRESAS]
  WHERE [IDSUCURSALEMPRESA] = @IDSUCURSALEMPRESA AND [RUTEMPRESA] = @RUTEMPRESA AND [CODOFICINA] = @OFICINA

----------------------------------------------------------------------------------------------------
 END