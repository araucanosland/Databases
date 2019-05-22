IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[SpMotor_CuentaFichaEmpresa]') AND type = 'P')
DROP PROCEDURE [dbo].[SpMotor_CuentaFichaEmpresa]
GO
CREATE procedure [dbo].[SpMotor_CuentaFichaEmpresa]
--exec [dbo].[SpMotor_CuentaFichaEmpresa]  71186200,'20173T'
 @RutEmpresa int,
 @Periodo varchar(7)
as

   DECLARE @existe int = 0
   select @existe = count(*) 
   from BD_HERRAMIENTAS..TabMotor_FichaEmpresa A
   inner join BD_HERRAMIENTAS..TabMotor_Empresa B
   on  CONVERT(INT,substring(a.Empresa_Rut,1,LEN(a.Empresa_Rut)-2))=b.Empresa_Rut 
   where  CONVERT(INT,substring(a.Empresa_Rut,1,LEN(a.Empresa_Rut)-2))=@RutEmpresa
   and a.Trimestre=@Periodo
   select @existe as N