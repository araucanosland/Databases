IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ListaEmpresas_Periodo]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ListaEmpresas_Periodo]
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMotor_ListaEmpresas_Periodo]
--	exec [dbo].[spMotor_ListaEmpresas_Periodo] '20173T'
   
    @Periodo as varchar(10)
AS
BEGIN
	SET NOCOUNT ON;

   DECLARE @existe int = 0
   select @existe = count(*) 
   from BD_HERRAMIENTAS..TabMotor_FichaEmpresa A
   inner join BD_HERRAMIENTAS..TabMotor_Empresa B
   on  CONVERT(INT,substring(a.Empresa_Rut,1,LEN(a.Empresa_Rut)-2))=b.Empresa_Rut 
 	
IF @existe > 0 
BEGIN
 Select distinct
		   A.Periodo
	       ,A.Empresa_Rut
		   ,A.Empresa_Dv
		   ,A.Empresa_Nombre
		   ,A.Empresa_Tipo
		  	,Case when a.Holding<>'' then 1
			else 0 
			end isHolding
		  FROM  BD_HERRAMIENTAS..TabMotor_Empresa A
			INNER JOIN TabMotor_Oficinas B
			ON A.Cod_Sucursal=B.Cod_Oficina
	  where Periodo=@Periodo


	 
END
ELSE
BEGIN
	Select  DISTINCT 
		  A.Periodo
	       ,A.Empresa_Rut
		   ,A.Empresa_Dv
		   ,A.Empresa_Nombre
		   ,A.Empresa_Tipo
		  	,Case when a.Holding<>'' then 1
			else 0 
			end isHolding
		  FROM  BD_HERRAMIENTAS..TabMotor_Empresa A
			INNER JOIN TabMotor_Oficinas B
			ON A.Cod_Sucursal=B.Cod_Oficina
			where  Periodo=@Periodo
	
END
END