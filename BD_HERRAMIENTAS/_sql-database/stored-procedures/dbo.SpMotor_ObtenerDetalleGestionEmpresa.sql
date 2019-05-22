IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[SpMotor_ObtenerDetalleGestionEmpresa]') AND type = 'P')
DROP PROCEDURE [dbo].[SpMotor_ObtenerDetalleGestionEmpresa]
GO
CREATE procedure [dbo].[SpMotor_ObtenerDetalleGestionEmpresa]
--EXEC [SpMotor_ObtenerDetalleGestionEmpresa] 81537600 ,'20173T'
@EmpresaRut varchar(50),
@Trimestre varchar(7),
@TokenEjecutivo varchar(40)
as

DECLARE @Periodo INT = dbo.fnMotor_ObtenerPeriodoActual()
--SELECT @Periodo
/*DECLARE @existe int = 0
  select @existe = count(*) 
   from BD_HERRAMIENTAS..TabMotor_FichaEmpresa A
   inner join BD_HERRAMIENTAS..TabMotor_Empresa B
   on  CONVERT(INT,substring(a.Empresa_Rut,1,LEN(a.Empresa_Rut)-2))=b.Empresa_Rut 
   where  CONVERT(INT,substring(a.Empresa_Rut,1,LEN(a.Empresa_Rut)-2))=@EmpresaRut*/
 --  SELECT @existe
   --and a.Trimestre=@Periodo
 
select 
 DISTINCT
 a.Empresa_Nombre
 ,A.Id_Ficha
,A.Empresa_Rut
,A.Nombre_Funcionario_Emple
,b.OFICINA
,A.Estamento
,A.EstadoGuardar 
,C.Nombre
,A.RutEjec
,A.Trimestre
,Case when x.Holding<>'' then 1
			else 0 
			end isHolding
,A.Cargo_Funcionario Cargo
,A.Fecha_Ingreso
,a.fecha_reunion
,A.NombreSucursal
,A.Direccion
from TabMotor_FichaEmpresa A
inner JOIN TabMotor_Empresa x on CONVERT(INT,substring(a.Empresa_Rut,1,LEN(a.Empresa_Rut)-2)) = x.Empresa_Rut
LEFT JOIN  TabMotor_Oficinas B ON A.Cod_Sucursal=B.Cod_Oficina
lEFT JOIN TabMotor_Dotacion C ON CONVERT(numeric,A.RutEjec)=C.Ejec_Rut AND CONVERT(INT,C.Periodo)=@Periodo
where CONVERT(INT,substring(a.Empresa_Rut,1,LEN(a.Empresa_Rut)-2))=@EmpresaRut
and  A.Cod_Sucursal=BD_REPORTES.negocios.fnSca_ObtenerOficinaByToken(@TokenEjecutivo)