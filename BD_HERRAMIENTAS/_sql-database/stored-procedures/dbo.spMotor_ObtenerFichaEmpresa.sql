IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ObtenerFichaEmpresa]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ObtenerFichaEmpresa]
GO
CREATE procedure [dbo].[spMotor_ObtenerFichaEmpresa]
--EXEC [spMotor_ObtenerFichaEmpresa] 10
@idEmpresa int
as
Select  DISTINCT 
			c.id_ficha
			,A.Periodo
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
			end Holding
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
		  FROM    
		    BD_HERRAMIENTAS..TabMotor_Empresa A
			INNER JOIN BD_ODS..TabMae_Oficinas B
			ON A.Cod_Sucursal=B.Cod_Oficina
			INNER JOIN   BD_HERRAMIENTAS..TabMotor_FichaEmpresa c
			ON CONVERT(INT,A.Empresa_Rut)=CONVERT(INT,substring(C.Empresa_Rut,1,LEN(C.Empresa_Rut)-2)) 
			where C.Id_Ficha=@idEmpresa 


			--SELECT * FROM BD_HERRAMIENTAS..TabMotor_FichaEmpresa