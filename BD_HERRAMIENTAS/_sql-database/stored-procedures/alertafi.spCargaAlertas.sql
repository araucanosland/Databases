IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[alertafi].[spCargaAlertas]') AND type = 'P')
DROP PROCEDURE [alertafi].[spCargaAlertas]
GO
--exec [alertafi].[spCargaAlertas]
CREATE PROCEDURE [alertafi].[spCargaAlertas]
as
delete BD_HERRAMIENTAS.alertafi.TabMotor_AfiAlertas
insert into BD_HERRAMIENTAS.alertafi.TabMotor_AfiAlertas
select * 
--into BD_HERRAMIENTAS.alertafi.TabMotor_AfiAlertas
from( 
select fecAct Actualizacion
	  ,AFIRUT AfiliadoRut
	  ,AFIRUTDV AfiRutDv
	  ,MTO_PAGO valor
	  ,ETAPA_PRO Tipo
From  [serv-55].bd_cargas.dbo.TabLicencias_SIL 
where (ETAPA_PRO='DISPONIBLE PARA PAGO' and est_pag_te='IMPRESO' and TIP_PAGO='CHEQ')
--or (ETAPA_PRO='PAGADO' and est_pag_te='IMPRESO' and TIP_PAGO='CHEQ' and EST_DOCTO='IMPRESO')
union all
--select fecAct	Actualizacion
--	  ,AFIRUT	AfiliadoRut
--	  ,AFIRUTDV	AfiRutDv
--	  ,MTO_PAGO	valor
--	  ,ESTADO	Tipo
--	  from  [serv-55].bd_cargas.dbo.TabLicencias_SIL 
--where ESTADO='PENDIENTE'
select (select max(fecAct) from [serv-55].bd_cargas.dbo.TabLicencias_SIL) Actualizacion
		,AfiliadoRut 
		,'' AfiRutDv 
		,Valor
		,Tipo 
		from [dbo].[TabMotor_Notificacion_Asignacion]
where Tipo='LICENCIA'
union all
select (select max(fecAct) from [serv-55].bd_cargas.dbo.TabLicencias_SIL) Actualizacion
		,AfiliadoRut 
		,'' AfiRutDv 
		,Valor
		,Tipo 
		from [dbo].[TabMotor_Notificacion_Asignacion]
where Tipo='PAGEXCESO'
) A