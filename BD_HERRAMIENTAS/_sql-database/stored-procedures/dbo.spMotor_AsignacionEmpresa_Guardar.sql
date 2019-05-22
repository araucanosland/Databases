IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_AsignacionEmpresa_Guardar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_AsignacionEmpresa_Guardar]
GO
CREATE Procedure [dbo].[spMotor_AsignacionEmpresa_Guardar]

(
	    @RutEmpresa int 
	   ,@Cod_Sucursal int
	   ,@ReasigObservacion varchar(250) =null
		 ,@Cod_Sucursal_anterior int
)
as
begin


	IF @RutEmpresa <> 0 
	begin

			update   [dbo].[TabMotor_Empresa]
			set 
			 Cod_Sucursal = (CASE WHEN Holding='' THEN @Cod_Sucursal WHEN Holding<>'' THEN  0 END)
			,Reasing_Flag=1
			,Reasing_Observacion =@ReasigObservacion
			,Resing_CodsucursalAnterior = @Cod_Sucursal_anterior
			where Empresa_Rut=@RutEmpresa and Cod_Sucursal = @Cod_Sucursal_anterior
			
	end


end