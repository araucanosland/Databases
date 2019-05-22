IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Ingresolicencia_ActualizarDerivacion]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Ingresolicencia_ActualizarDerivacion]
GO


CREATE PROCEDURE [licencias].[sp_Lic_Ingresolicencia_ActualizarDerivacion]
(
	
	@Token varchar(50),
	@RutAfiliado varchar(50),
	@FolioLicencia varchar(100)
)
AS

BEGIN

	SET NOCOUNT ON;

	DECLARE @identity bigint
	DECLARE @RUT_EJECUTIVO VARCHAR(50) = security.fnSca_ObtenerRutByToken(@Token)
	DECLARE @EX INT = 0, @OFC_EX VARCHAR(100), @FEC_EX VARChAR(50)
	DECLARE @OficinaToken int = security.fnSca_ObtenerOficinaByToken(@Token)
	  --Rescata sucursal Origen
	  Declare @SucursalOrigen int = 0
	  SELECT  @SucursalOrigen = x.Oficina     
	  FROM BD_HERRAMIENTAS.licencias.TabLic_IngresoLicencia x
	  WHERE x.RutAfiliado = @RutAfiliado
	  AND x.FolioLicencia = @FolioLicencia 
	  
	  -- rescata ejecutivo origen
	  DECLARE @EjecutivoOrigen varchar(50)=''
	  DECLARE @FechaIngreso datetime
	  SELECT  @EjecutivoOrigen=RutEjecutivo, @FechaIngreso=FechaIngreso
	  FROM BD_HERRAMIENTAS.licencias.TabLic_IngresoLicencia x
	  WHERE x.RutAfiliado = @RutAfiliado
	  AND x.FolioLicencia = @FolioLicencia


	INSERT INTO  BD_HERRAMIENTAS.licencias.TabLic_DerivacionSucursal
	   (
	   Fecha_Derivacion,
	   Sucursal_Origen,
	   Sucursal_Derivacion,
	   RutEjecutivo_Derivacion,
	   FolioLicencia,
	   RutAfiliado,
	   RutEjecutivo_Origen,
	   Fecha_PrimerIngreso

	   )
	   values
	   (
	   Getdate(),
	   @SucursalOrigen,
	   @OficinaToken,
	   @RUT_EJECUTIVO,
	   @FolioLicencia,
	   @RutAfiliado,
	   @EjecutivoOrigen,
	   @FechaIngreso
	   )



	--print @SucursalOrigen
	    UPDATE BD_HERRAMIENTAS.licencias.TabLic_IngresoLicencia
	   SET Oficina = @OficinaToken,
	       FechaIngreso=GETDATE(),
		   FlagEstado=2--- 2 estado recepcionado
	   WHERE RutAfiliado=@RutAfiliado
	   and FolioLicencia=@FolioLicencia

	
	   
	
END