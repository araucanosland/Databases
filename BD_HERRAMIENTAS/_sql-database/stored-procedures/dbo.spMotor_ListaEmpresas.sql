IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ListaEmpresas]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ListaEmpresas]
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMotor_ListaEmpresas]
--	exec [spMotor_ListaEmpresas] '1ca0ecbd-4bb1-46a5-993e-c47dbee2a31a','20173T'
   @TokenEjecutivo AS varchar(40),
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
 Select  distinct
		   a.id_Empresa
		   ,A.Periodo
	       ,A.Empresa_Rut
		   ,A.Empresa_Dv
		   ,A.Empresa_Nombre
		   ,A.Empresa_Tipo
		   ,A.Empresa_Clasificacion
		   ,A.Ejec_Rut
		   ,A.Ejec_Dv
		   ,A.Cod_Sucursal
		   ,B.Oficina
		   ,a.Holding
		   ,isnull(a.Estado,'') Estado
			,Case when a.Holding<>'' then 1
			else 0 
			end isHolding
		   --,0 CantidadFichas
		   ,(select count(*) from BD_HERRAMIENTAS..TabMotor_FichaEmpresa xx where A.Empresa_Rut = CONVERT(INT,substring(xx.Empresa_Rut,1,LEN(xx.Empresa_Rut)-2)) and A.Periodo = xx.Trimestre) CantidadFichas
		  FROM  BD_HERRAMIENTAS..TabMotor_Empresa A
			INNER JOIN TabMotor_Oficinas B
			ON A.Cod_Sucursal=B.Cod_Oficina
	  where A.Cod_Sucursal=BD_REPORTES.negocios.fnSca_ObtenerOficinaByToken(@TokenEjecutivo)
	  and Periodo=@Periodo
	  order by Estado asc


	 
END
ELSE
BEGIN
	Select  DISTINCT 
		   a.id_Empresa
		   ,A.Periodo
	       ,A.Empresa_Rut
		   ,A.Empresa_Dv
		   ,A.Empresa_Nombre
		   ,A.Empresa_Tipo
		   ,A.Empresa_Clasificacion
		   ,A.Ejec_Rut
		   ,A.Ejec_Dv
		   ,A.Cod_Sucursal
		   ,B.Oficina
		   ,a.Holding
		 ,isnull(a.Estado,'') Estado
		 ,0 CantidadFichas
			,Case when a.Holding<>'' then 1
			else 0 
			end isHolding
		  FROM  BD_HERRAMIENTAS..TabMotor_Empresa A
			INNER JOIN TabMotor_Oficinas B
			ON A.Cod_Sucursal=B.Cod_Oficina
			where A.Cod_Sucursal=BD_REPORTES.negocios.fnSca_ObtenerOficinaByToken(@TokenEjecutivo)
	     and Periodo=@Periodo
		 order by Estado asc
END
END