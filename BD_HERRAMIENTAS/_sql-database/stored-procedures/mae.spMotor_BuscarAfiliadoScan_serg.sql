IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[spMotor_BuscarAfiliadoScan_serg]') AND type = 'P')
DROP PROCEDURE [mae].[spMotor_BuscarAfiliadoScan_serg]
GO
CREATE procedure [mae].[spMotor_BuscarAfiliadoScan_serg]
(
	@RutAfiliado int
)
as

SELECT distinct 
	  A.Periodo
      ,A.FechaCorte
      ,convert(varchar,A.RutAfiliado)+'-'+A.DvAfiliado RutAfiliado
      ,A.Nombres +' '+ A.Apellidos Nombres
      ,A.Apellidos
      ,A.Nacionalidad
      ,A.Sexo
     , Case when convert(varchar(11),A.FechaNacimiento,105)<='01-01-1900' 
	   then 'Actualizar Información' --FechaNacimiento
	   ELSE
	   convert(varchar(11),A.FechaNacimiento,105) +'  ('+ convert(varchar,dbo.FN_getEdad(A.FechaNacimiento)) + ') ' +'Años'
	   end FechaNacimiento
	  ,Case when convert(varchar(11),A.FechaNacimiento,105)<='01-01-1900'
	  then '0'
	  else
	  dbo.FN_getEdad(A.FechaNacimiento) 
	  end Edad
      ,A.EstadoCivil
      ,case when RolSegmentoAfiliado is null then '' 
	  else
	  ltrim(replace(RolSegmentoAfiliado,'Afiliado','')) end RolSegmentoAfiliado
      ,left(B.Nombre_mes,3) +' '+left(b.Periodo,4) InicioValidezRol--,convert(varchar(11),A.InicioValidezRol,105)InicioValidezRol
     ,convert(varchar(11),A.FinValidezRol,105) FinValidezRol
      ,A.RegimenPrevisional
      ,A.RegimenSalud
      ,A.CargoAfiliado
      ,A.TipoContrato
     ,A.PeriodoUltimaRenta
      ,A.RentaUltimaInformada
      ,A.RegionAfiliado
      ,A.ComunaAfiliado
      --,A.IdEmpresa
      --,A.RegionEmpresa
      --,A.ComunaEmpresa
      --,convert(varchar,A.rutempresa)+'-'+A.dvempresa RutEmpresa
      --,A.nombreempresa
      --,A.idformajuridica
	  ,isnull(cel.Cel,'Sin Información') Cel
	  ,isnull(Fono.Fono,'Sin Información') Fono
	  ,isnull(Mail.Mail,'Sin Información') Mail
	  ,A.Vigente
	  ,A.Fallecido
	  ,isnull(flagNM.FlagEstado,0) FlagNoMolestar
From mae.Afiliados A
Left Join (
                    Select Top 1 
                    Afiliado_rut,Valor_contacto Cel
                    From [BD_HERRAMIENTAS].[dbo].[TabMotor_Contacto_Afiliado] 
                    where Valido=1 
                    And Tipo_contacto='CELULAR' 
                    And Afiliado_rut=@RutAfiliado 
                    Order by Fecha_contacto Desc, Fecha_accion Desc
                    ) Cel
On A.RutAfiliado=Cel.Afiliado_rut
Left Join (
                    Select Top 1 
                    Afiliado_rut,Valor_contacto Fono
                    From [BD_HERRAMIENTAS].[dbo].[TabMotor_Contacto_Afiliado] 
                    where Valido=1 
                    And Tipo_contacto='TELEFONO' 
                    And Afiliado_rut=@RutAfiliado 
                    Order by Fecha_contacto Desc, Fecha_accion Desc
                    ) Fono
On A.RutAfiliado=Fono.Afiliado_rut
Left Join (
                    Select Top 1 
                    Afiliado_rut,Valor_contacto Mail
                    From [BD_HERRAMIENTAS].[dbo].[TabMotor_Contacto_Afiliado] 
                    where Valido=1 
                    And Tipo_contacto='EMAIL__' 
                    And Afiliado_rut=@RutAfiliado
                    Order by Fecha_contacto Desc, Fecha_accion Desc
                    ) Mail
On A.RutAfiliado=Mail.Afiliado_rut
left join BD_HERRAMIENTAS.mae.DIaHabil B
on left(replace(convert(varchar,(A.InicioValidezRol)),'-',''),6)=b.Periodo

left join (SELECT FlagEstado, RutAfiliado FROM TabMotor_No_Molestar
							WHERE Id_NoMolestar = (SELECT MAX(Id_NoMolestar)
							FROM TabMotor_No_Molestar where LEFT(RutAfiliado,CHARINDEX('-',RutAfiliado)-1) = @RutAfiliado 
							) and LEFT(RutAfiliado,CHARINDEX('-',RutAfiliado)-1) = @RutAfiliado ) flagNM
							on convert(varchar,A.RutAfiliado)+'-'+A.DvAfiliado = flagNM.RutAfiliado
Where A.RutAfiliado=@RutAfiliado