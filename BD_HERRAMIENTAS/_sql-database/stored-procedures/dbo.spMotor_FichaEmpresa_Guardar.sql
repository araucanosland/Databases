IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_FichaEmpresa_Guardar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_FichaEmpresa_Guardar]
GO
CREATE Procedure [dbo].[spMotor_FichaEmpresa_Guardar]

(
	   @id int = 0
      ,@Empresa_Rut					varchar(250)=null
      ,@Empresa_Nombre				varchar(250)=null
      ,@Cod_Sucursal				varchar(250)=null
      ,@Estamento					varchar(50) =null
      ,@Nombre_Funcionario_Emple	varchar(250)=null
      ,@Cargo_Funcionario			varchar(250)=null
      ,@Num_Empleados				varchar(250)=null
      ,@funcionario_caja			varchar(250)=null
      ,@pregunta_1					varchar(50)	=null
      ,@pregunta_1_obs				varchar(250)=null
      ,@pregunta_2_radio			varchar(250)=null
      ,@pregunta_2_combo			varchar(50)	=null
      ,@pregunta_2_obs2				varchar(250)=null
      ,@pregunta_2_radio_1			varchar(250)=null
      ,@pregunta_2_obs3				varchar(250)=null
      ,@pregunta_2_obs4				varchar(250)=null
      ,@pregunta_2_obs5				varchar(250)=null
      ,@pregunta_3_radio			varchar(250)=null
      ,@pregunta_3_obs				varchar(50)	=null
      ,@pregunta_4_radio			varchar(250)=null
      ,@pregunta_4_radio_2			varchar(250)=null
      ,@pregunta_4_obs_1			varchar(250)=null
      ,@pregunta_4_obs_2			varchar(250)=null
      ,@pregunta_5_radio			varchar(250)=null
      ,@pregunta_5_obs_1			varchar(250)=null
      ,@pregunta_5_obs_2			varchar(250)=null
      ,@pregunta_6_radio			varchar(250)=null
      ,@pregunta_6_obs_1			varchar(250)=null
      ,@pregunta_6_obs_2			varchar(250)=null
      ,@pregunta_7_radio			varchar(250)=null
      ,@pregunta_7_obs_1			varchar(250)=null
      ,@pregunta_8					varchar(50)	=null
      ,@pregunta_8_obs_1			varchar(250)=null
      ,@pregunta_9_radio			varchar(250)=null
      ,@pregunta_9_radio_2			varchar(250)=null
      ,@pregunta_9_obs				varchar(250)=null
      ,@pregunta_10_radio			varchar(250)=null
      ,@pregunta_10_radio_2			varchar(250)=null
      ,@pregunta_10_obs				varchar(250)=null
      ,@pregunta_11					varchar(250)=null
      ,@pregunta_11_obs				varchar(250)=null
	  ,@token						varchar(50)
	  ,@Estado						varchar(100)
	  ,@Anexo						varchar(100)=null
	  ,@nContacto					varchar(20)=null
	  ,@Email						varchar(250)=null
	  ,@NombreSucursal				varchar(250)=null
	  ,@DireccionSucursal			varchar(250)=null
)
AS
BEGIN
IF @id = 0 
begin
INSERT INTO  [DBO].[TabMotor_FichaEmpresa]
(
[Fecha_Ingreso]
,[Empresa_Rut]
,[Empresa_Nombre]
,[Cod_Sucursal]
,[Estamento]
,[Nombre_Funcionario_Emple]
,[Cargo_Funcionario]
,[Num_Empleados]
,[funcionario_caja]
,[pregunta_1]
,[pregunta_1_obs]
,[pregunta_2_radio]
,[pregunta_2_combo]
,[pregunta_2_obs2]
,[pregunta_2_radio_1]
,[pregunta_2_obs3]
,[pregunta_2_obs4]
,[pregunta_2_obs5]
,[pregunta_3_radio]
,[pregunta_3_obs]
,[pregunta_4_radio]
,[pregunta_4_radio_2]
,[pregunta_4_obs_1]
,[pregunta_4_obs_2]
,[pregunta_5_radio]
,[pregunta_5_obs_1]
,[pregunta_5_obs_2]
,[pregunta_6_radio]
,[pregunta_6_obs_1]
,[pregunta_6_obs_2]
,[pregunta_7_radio]
,[pregunta_7_obs_1]
,[pregunta_8]
,[pregunta_8_obs_1]
,[pregunta_9_radio]
,[pregunta_9_radio_2]
,[pregunta_9_obs]
,[pregunta_10_radio]
,[pregunta_10_radio_2]
,[pregunta_10_obs]
,[pregunta_11]
,[pregunta_11_obs]
,[fecha_reunion]
,RutEjec
,EstadoGuardar
,Anexo
,Fono
,Mail
,NombreSucursal
,Direccion
)
VALUES
(
GETDATE()				
,@Empresa_Rut					
,@Empresa_Nombre				
,@Cod_Sucursal				
,@Estamento					
,@Nombre_Funcionario_Emple	
,@Cargo_Funcionario			
,@Num_Empleados				
,@funcionario_caja			
,@pregunta_1					
,@pregunta_1_obs				
,@pregunta_2_radio			
,@pregunta_2_combo			
,@pregunta_2_obs2				
,@pregunta_2_radio_1			
,@pregunta_2_obs3				
,@pregunta_2_obs4				
,@pregunta_2_obs5				
,@pregunta_3_radio			
,@pregunta_3_obs				
,@pregunta_4_radio			
,@pregunta_4_radio_2			
,@pregunta_4_obs_1			
,@pregunta_4_obs_2			
,@pregunta_5_radio			
,@pregunta_5_obs_1			
,@pregunta_5_obs_2			
,@pregunta_6_radio			
,@pregunta_6_obs_1			
,@pregunta_6_obs_2			
,@pregunta_7_radio			
,@pregunta_7_obs_1			
,@pregunta_8					
,@pregunta_8_obs_1			
,@pregunta_9_radio			
,@pregunta_9_radio_2			
,@pregunta_9_obs				
,@pregunta_10_radio			
,@pregunta_10_radio_2			
,@pregunta_10_obs				
,@pregunta_11					
,@pregunta_11_obs				
,getdate()				
,CONVERT(INT,substring(security.fnSca_ObtenerRutByToken(@token),1,LEN(security.fnSca_ObtenerRutByToken(@token))-2)),
@Estado
,@Anexo
,@nContacto
,@Email
,@NombreSucursal
,@DireccionSucursal

)
end
else
begin 
update  [DBO].[TabMotor_FichaEmpresa]
set 
 --[Fecha_Ingreso]				=GETDATE()	
[Estamento]				=@Estamento
,[Nombre_Funcionario_Emple]	=@Nombre_Funcionario_Emple
,[Cargo_Funcionario]		=@Cargo_Funcionario
,[Num_Empleados]			=@Num_Empleados
,[funcionario_caja]			=@funcionario_caja
,[pregunta_1]				=@pregunta_1
,[pregunta_1_obs]			=@pregunta_1_obs
,[pregunta_2_radio]			=@pregunta_2_radio
,[pregunta_2_combo]			=@pregunta_2_combo
,[pregunta_2_obs2]			=@pregunta_2_obs2
,[pregunta_2_radio_1]		=@pregunta_2_radio_1
,[pregunta_2_obs3]			=@pregunta_2_obs3
,[pregunta_2_obs4]			=@pregunta_2_obs4
,[pregunta_2_obs5]			=@pregunta_2_obs5
,[pregunta_3_radio]			=@pregunta_3_radio
,[pregunta_3_obs]			=@pregunta_3_obs
,[pregunta_4_radio]			=@pregunta_4_radio
,[pregunta_4_radio_2]		=@pregunta_4_radio_2
,[pregunta_4_obs_1]			=@pregunta_4_obs_1
,[pregunta_4_obs_2]			=@pregunta_4_obs_2
,[pregunta_5_radio]			=@pregunta_5_radio
,[pregunta_5_obs_1]			=@pregunta_5_obs_1
,[pregunta_5_obs_2]			=@pregunta_5_obs_2
,[pregunta_6_radio]			=@pregunta_6_radio
,[pregunta_6_obs_1]			=@pregunta_6_obs_1
,[pregunta_6_obs_2]			=@pregunta_6_obs_2
,[pregunta_7_radio]			=@pregunta_7_radio
,[pregunta_7_obs_1]			=@pregunta_7_obs_1
,[pregunta_8]				=@pregunta_8
,[pregunta_8_obs_1]			=@pregunta_8_obs_1
,[pregunta_9_radio]			=@pregunta_9_radio
,[pregunta_9_radio_2]		=@pregunta_9_radio_2
,[pregunta_9_obs]			=@pregunta_9_obs
,[pregunta_10_radio]		=@pregunta_10_radio
,[pregunta_10_radio_2]		=@pregunta_10_radio_2
,[pregunta_10_obs]			=@pregunta_10_obs
,[pregunta_11]				=@pregunta_11
,[pregunta_11_obs]			=@pregunta_11_obs
,[fecha_reunion]			=GETDATE()
,[RutEjec]					=CONVERT(INT,substring(security.fnSca_ObtenerRutByToken(@token),1,LEN(security.fnSca_ObtenerRutByToken(@token))-2)),
[EstadoGuardar]			    =@Estado
,Anexo					    =@Anexo
,Fono						= @nContacto
,Mail						=@Email
,NombreSucursal				=@NombreSucursal
,Direccion					=@DireccionSucursal
where Id_Ficha=@id
END
END