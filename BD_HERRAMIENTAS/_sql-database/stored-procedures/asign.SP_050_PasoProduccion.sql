IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[asign].[SP_050_PasoProduccion]') AND type = 'P')
DROP PROCEDURE [asign].[SP_050_PasoProduccion]
GO
				
CREATE Proc [asign].[SP_050_PasoProduccion]
 as
 --------------------------------------#Comercial
--Declare @maxId numeric = (Select MAx([id_Asign]) FROM BD_Herramientas.dbo.TabMotor_Asignacion )

--Insert Into BD_HERRAMIENTAS.dbo.TabMotor_Asignacion
--SELECT --Top 10  
--	   @maxId+[id_Asign]
--      ,[Periodo]
--      ,[Afiliado_Rut]
--      ,[Afiliado_Dv]
--      ,[Nombre]
--      ,[Apellido]
--      ,[Empresa_Rut]
--      ,[Empresa_Dv]
--      ,[Empresa]
--      ,[ClaRiesgoEmpresa]
--      ,[Holding]
--      ,[Celular]
--      ,[Telefono1]
--      ,[Telefono2]
--      ,[Email]
--      ,[MontoPension]
--      ,[MontoRenta]
--      ,[Monto_preaprobado]
--      ,[Antiguedad_en_Meses]
--      ,[LicMedicaVigente]
--      ,[CreditosVigentes]
--      ,[CredVig_Meses_Morosos]
--      ,[CredVig_MontoCuota]
--      ,[EsPensionado]
--      ,[EsPrivado]
--      ,[EsPublico]
--      ,[Contacto]
--      ,[Segmento]
--      ,[FechaNacimiento]
--      ,[Edad]
--      ,[PensionadoFFAA]
--      ,[EmpresaEsPensionado]
--      ,[EmpresaEsPublico]
--      ,[EmpresaEsPrivado]
--      ,[RiesgoPerfil]
--      ,[RiesgoMaxVecesRenta]
--      ,[RiesgoMaxPreAprobado]
--      ,[PreAprobadoFinal]
--      ,[CredVigente]
--      ,[Oficina]
--      ,[Asignado]
--      ,[Ejec_Asignacion]
--      ,Case When [Asignado]=5 Then 5 Else 1 End [TipoAsignacion]
--      ,[Prioridad]
--      ,[TipoCampania]
--	  ,Cuadrante
--	  ,OfertaTexto
--	  ,'' TipoDerivacion
--FROM [Serv-55].BD_MOTOR.asign.TabMotor_Asignacion_paso 
--order by[id_Asign]

 
--------------------------------------------------------
----------------------------------------#Normalizacion
--Set @maxId = 0
--set @maxId = (Select MAx([id_Asign]) FROM BD_Herramientas.dbo.TabMotor_Asignacion )

-- Insert Into BD_HERRAMIENTAS.dbo.TabMotor_Asignacion
--SELECT --Top 10  
--	   @maxId+[id_Asign]  ---Fijarse en el max ID 
--      ,[Periodo]
--      ,[Afiliado_Rut]
--      ,[Afiliado_Dv]
--      ,[Nombre]
--      ,[Apellido]
--      ,[Empresa_Rut]
--      ,[Empresa_Dv]
--      ,Empresa_nombre [Empresa]
--      ,[ClaRiesgoEmpresa]
--      ,[Holding]
--      ,[Celular]
--      ,[Telefono1]
--      ,[Telefono2]
--      ,[Email]
--      ,[MontoPension]
--      ,[MontoRenta]
--      ,[Monto_preaprobado]
--      ,[Antiguedad_en_Meses]
--      ,[LicMedicaVigente]
--      ,[CreditosVigentes]
--      ,[CredVig_Meses_Morosos]
--      ,[CredVig_MontoCuota]
--      ,[EsPensionado]
--      ,[EsPrivado]
--      ,[EsPublico]
--      ,[Contacto]
--      ,[Segmento]
--      ,[FechaNacimiento]
--      ,[Edad]
--      ,[PensionadoFFAA]
--      ,[EmpresaEsPensionado]
--      ,[EmpresaEsPublico]
--      ,[EmpresaEsPrivado]
--      ,[RiesgoPerfil]
--      ,[RiesgoMaxVecesRenta]
--      ,[RiesgoMaxPreAprobado]
--      ,[PreAprobadoFinal]
--      ,CreditoVigente [CredVigente]
--      ,[Oficina]
--      ,[Asignado]
--      ,[Ejec_Asignacion]
--      ,2 [TipoAsignacion]
--      ,[Prioridad]
--      ,[TipoCampania]
--	  ,0	Cuadrante
--	  ,''	OfertaTexto
--	  ,''	TipoDerivacion
--FROM [Serv-55].BD_MOTOR.asign.TabMotor_Asignacion_Repro
--order by[id_Asign]
 

 
--------------------------------------------------------
----------------------------------------#SegCesantia
--Set @maxId = 0
--set @maxId = (Select MAX([id_Asign]) FROM BD_Herramientas.dbo.TabMotor_Asignacion )

--Insert Into BD_HERRAMIENTAS.dbo.TabMotor_Asignacion
--SELECT --Top 10  
--	   @maxId+[id_Asign]  ---Fijarse en el max ID 
--      ,[Periodo]
--      ,[Afiliado_Rut]
--      ,[Afiliado_Dv]
--      ,[Nombre]
--      ,[Apellido]
--      ,[Empresa_Rut]
--      ,[Empresa_Dv]
--      ,[Empresa]
--      ,[ClaRiesgoEmpresa]
--      ,[Holding]
--      ,[Celular]
--      ,[Telefono1]
--      ,[Telefono2]
--      ,[Email]
--      ,[MontoPension]
--      ,[MontoRenta]
--      ,[Monto_preaprobado]
--      ,[Antiguedad_en_Meses]
--      ,[LicMedicaVigente]
--      ,[CreditosVigentes]
--      ,[CredVig_Meses_Morosos]
--      ,[CredVig_MontoCuota]
--      ,[EsPensionado]
--      ,[EsPrivado]
--      ,[EsPublico]
--      ,[Contacto]
--      ,[Segmento]
--      ,[FechaNacimiento]
--      ,[Edad]
--      ,[PensionadoFFAA]
--      ,[EmpresaEsPensionado]
--      ,[EmpresaEsPublico]
--      ,[EmpresaEsPrivado]
--      ,[RiesgoPerfil]
--      ,[RiesgoMaxVecesRenta]
--      ,[RiesgoMaxPreAprobado]
--      ,[PreAprobadoFinal]
--      ,[CredVigente]
--      ,[Oficina]
--      ,[Asignado]
--      ,[Ejec_Asignacion]
--      ,[TipoAsignacion]
--      ,[Prioridad]
--      ,[TipoCampania]
--	  ,[Cuadrante]
--	  ,[OfertaTexto]
--	  ,''	TipoDerivacion
--From [Serv-55].BD_Motor.asign.TabMotor_Asignacion_SegCesantia
--Order by[id_Asign]


-----------Actualizo el Periodo para Mostrar los ultimos 6 meses de carga ya que 6 meses de carencia tiene el Seguro para alacnazr a gestionar
--Declare @phoy varchar(6)= (select Top 1 Periodo From [Serv-55].BD_Motor.asign.TabMotor_Asignacion_SegCesantia )
--Declare @pAnt varchar(6)= (select Left(Convert(varchar,dateadd(m,-5,Convert(varchar,@phoy+'01',112)),112),6))

--UPdate A Set Periodo=@phoy
--From BD_HERRAMIENTAS.dbo.TabMotor_Asignacion A 
--where TipoAsignacion=4  
--And ClaRiesgoEmpresa Between @pAnt And @phoy	--Periodo de Carga

--------------------------------------------------------

--Exec BD_HERRAMIENTAS.proceso.spCargaUsuarios


--------------------------------------------------------
----------------------------------------#Carga Motivos de Rechazo

--Delete BD_Herramientas.dbo.TabMotor_Asignacion_Rechazos Where Periodo in (Select Max(Periodo) FROM [Serv-55].BD_Motor.asign.TabMotor_Asignacion_Rechazos)
--Insert Into BD_Herramientas.dbo.TabMotor_Asignacion_Rechazos
--Select * From [Serv-55].BD_Motor.asign.TabMotor_Asignacion_Rechazos Where Periodo in (Select Max(Periodo) FROM [Serv-55].BD_Motor.asign.TabMotor_Asignacion_Rechazos)


 
------------------Resumen

--Select Periodo,TipoASignacion,count(1)
--From BD_HERRAMIENTAS.dbo.TabMotor_Asignacion
--Where Periodo=(Select Max(Periodo) From BD_HERRAMIENTAS.dbo.TabMotor_Asignacion)
--Group By Periodo,TipoASignacion

--Select Count(1) From [serv-55].BD_MOTOR.asign.Tabmotor_asignacion_paso
--Select Count(1) From [serv-55].BD_MOTOR.asign.TabMotor_Asignacion_Repro
--Select Count(1) From [serv-55].BD_MOTOR.asign.TabMotor_Asignacion_SegCesantia



--------------------------------------------------------------------------------------------------------------

-------------------------Guarda Asignación Inicial 

-------#Comercial
--Delete [serv-55].BD_MOTOR.asign.TabMotor_Asignacion_Hist Where Periodo IN (Select Top 1 Periodo From [serv-55].BD_MOTOR.asign.TabMotor_Asignacion_Paso)
--Insert INto [serv-55].BD_MOTOR.asign.TabMotor_Asignacion_Hist
--Select *,'','','' From [serv-55].BD_MOTOR.asign.TabMotor_Asignacion_Paso

 
-------#Normalizacion
--Delete [serv-55].BD_MOTOR.asign.TabMotor_Asignacion_Repro_Hist Where Periodo IN (Select Top 1 Periodo From [serv-55].BD_MOTOR.asign.TabMotor_Asignacion_Repro)
--Insert INto [serv-55].BD_MOTOR.asign.TabMotor_Asignacion_Repro_Hist
--Select *,'' From [serv-55].BD_MOTOR.asign.TabMotor_Asignacion_Repro


-------#Cesantia
--Delete [serv-55].BD_MOTOR.asign.TabMotor_Asignacion_SegCesantia_Hist Where Periodo IN (Select Top 1 Periodo From [serv-55].BD_MOTOR.asign.TabMotor_Asignacion_SegCesantia)
--Insert INto [serv-55].BD_MOTOR.asign.TabMotor_Asignacion_SegCesantia_Hist
--Select *,'' From [serv-55].BD_MOTOR.asign.TabMotor_Asignacion_SegCesantia


----------------------------------

   select 'ERROR: NOT APPLICABLE'