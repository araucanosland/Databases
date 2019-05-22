IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Elimina_Anexo]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Elimina_Anexo]
GO
create PROCEDURE [carteras].[spMotorCartera_Elimina_Anexo] 
 @RutEmpresa VARCHAR(50)
 ,@IdEmpresaAnexo VARCHAR(50)
 ,@Token VARCHAR(50)
AS
BEGIN

--exec [carteras].[spMotorCartera_Elimina_Anexo] '', ''


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
  FROM [BD_HERRAMIENTAS].[CARTERAS].[TABCART_ANEXOEMPRESA] 
  WHERE [RUTEMPRESA] = @RUTEMPRESA 
  AND [CODOFICINA] = @OFICINA)
  AND  IDEMPRESAANEXO = @IDEMPRESAANEXO

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
  DELETE FROM [BD_HERRAMIENTAS].[CARTERAS].[TABCART_ANEXOEMPRESA] 
  WHERE [RUTEMPRESA] = @RUTEMPRESA 
  AND [CODOFICINA] = @OFICINA
  AND  IDEMPRESAANEXO = @IDEMPRESAANEXO

----------------------------------------------------------------------------------------------------
 END