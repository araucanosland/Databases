IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ObtenerListaEmpresas]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ObtenerListaEmpresas]
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMotor_ObtenerListaEmpresas]
--	exec [spMotor_ObtenerListaEmpresas] 10,69180100, '20173T'
--76084201
--84358900
    @IdFicha int,
	@RutEmpresa INT,
	@Periodo varchar(6)
	
AS

BEGIN
	
	DECLARE @existe int = 0
	select @existe = count(*) 
	from BD_HERRAMIENTAS..TabMotor_FichaEmpresa
	where CONVERT(INT,substring(Empresa_Rut,1,LEN(Empresa_Rut)-2))  = @RutEmpresa
	SET NOCOUNT ON;
	
IF @IdFicha > 0 
BEGIN
    -- Insert statements for procedure here
	Select  DISTINCT A.Periodo
	        ,A.Empresa_Rut
		    ,A.Empresa_Dv
		    ,A.Empresa_Nombre
		    ,A.Empresa_Tipo
		    ,A.Empresa_Clasificacion
		    ,A.Ejec_Rut
		    ,A.Ejec_Dv
		    ,A.Cod_Sucursal
			,Case when A.Holding<>'' then 1
			else 0 
			end isHolding
				,A.Holding
		    ,B.Oficina
		    ,C.Cod_Sucursal
		    ,C.Estamento
		    ,C.Nombre_Funcionario_Emple
		    ,C.Cargo_Funcionario
		    ,C.Num_Empleados
		    ,C.funcionario_caja
		    ,c.pregunta_1
		    ,c.pregunta_1_obs
		    ,c.pregunta_2_radio
		    ,c.pregunta_2_combo
		    ,c.pregunta_2_obs2
		    ,c.pregunta_2_radio_1
		    ,c.pregunta_2_obs3
		    ,c.pregunta_2_obs4
		    ,c.pregunta_2_obs5
		    ,c.pregunta_3_radio
			,c.pregunta_3_obs
			,c.pregunta_4_radio
			,c.pregunta_4_radio_2
			,c.pregunta_4_obs_1
			,c.pregunta_4_obs_2
			,c.pregunta_5_radio
			,c.pregunta_5_obs_1
			,c.pregunta_5_obs_2
			,c.pregunta_6_radio
			,c.pregunta_6_obs_1
			,c.pregunta_6_obs_2
			,c.pregunta_7_radio
			,c.pregunta_7_obs_1
			,c.pregunta_8
			,c.pregunta_8_obs_1
			,c.pregunta_9_radio
			,c.pregunta_9_radio_2
			,c.pregunta_9_obs
			,c.pregunta_10_radio
			,c.pregunta_10_radio_2
			,c.pregunta_10_obs
			,c.pregunta_11
			,c.pregunta_11_obs
			,c.fecha_reunion
			,c.estamento_2
			,c.nombre_funcionario_emp_2
			,c.cargo_funcionario_2
			,c.EstadoGuardar
			,c.Trimestre
			,c.anexo
			,c.RutEjec
			,Id_Ficha
			,EstadoGuardar
			,c.Fono
			,c.mail
			,c.nombresucursal
			,c.Direccion
		  FROM    
		    BD_HERRAMIENTAS..TabMotor_Empresa A
			INNER JOIN TabMotor_Oficinas B
			ON A.Cod_Sucursal=B.Cod_Oficina
			INNER JOIN   BD_HERRAMIENTAS..TabMotor_FichaEmpresa c
			ON CONVERT(INT,A.Empresa_Rut)=CONVERT(INT,substring(C.Empresa_Rut,1,LEN(C.Empresa_Rut)-2)) 
			where c.Id_Ficha = @IdFicha

END

ELSE
BEGIN
Select distinct  A.Periodo
	        ,A.Empresa_Rut
		    ,A.Empresa_Dv
		    ,A.Empresa_Nombre
		    ,A.Empresa_Tipo
		    ,A.Empresa_Clasificacion
		    ,A.Ejec_Rut
		    ,A.Ejec_Dv
		    ,A.Cod_Sucursal
		    ,B.Oficina
			,Case when A.Holding<>'' then 1
			else 0 
			end isHolding,
			A.Holding
			FROM    
		    BD_HERRAMIENTAS..TabMotor_Empresa A
			inner JOIN TabMotor_Oficinas B
			ON A.Cod_Sucursal=B.Cod_Oficina 
			where replace(a.Periodo,' ','')=@Periodo and A.Empresa_Rut=@RutEmpresa
END

END