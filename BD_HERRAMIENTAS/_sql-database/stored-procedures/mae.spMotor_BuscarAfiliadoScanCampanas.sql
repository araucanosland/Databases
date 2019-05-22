IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[spMotor_BuscarAfiliadoScanCampanas]') AND type = 'P')
DROP PROCEDURE [mae].[spMotor_BuscarAfiliadoScanCampanas]
GO
--exec [mae].[spMotor_BuscarAfiliadoScanCampanas]16770677
CREATE procedure [mae].[spMotor_BuscarAfiliadoScanCampanas]
(
	@RutAfiliado int
)
as

select distinct * from 
(
select distinct a.Periodo
		,a.Afiliado_Rut
		,a.Afiliado_Dv
		,case when a.TipoAsignacion in(1,5) then 'Comercial'
		when a.TipoAsignacion=2 then 'Normalización'
		when a.TipoAsignacion=4 then 'Seguro Cesantía'
		end Campania
		--,a.Campania
		,a.PreAprobadoFinal Oferta
		,a.Prioridad
		,a.TipoAsignacion
		,a.id_Asign
		,EstMotor.eges_nombre  EstadoGestion
		,SubEMotor.eges_nombre SubEstadoGestion
		,b.ges_fecha_compromete FComprometeGestion
		 from BD_HERRAMIENTAS..TabMotor_Asignacion A
left JOIN BD_HERRAMIENTAS.dbo.TabMotor_Gestion B 
on a.id_Asign=b.ges_bcam_uid and b.ges_fecha_accion is not null and b.ges_fecha_accion=(select max(xx.ges_fecha_accion) from  BD_HERRAMIENTAS.dbo.TabMotor_Gestion xx where xx.ges_bcam_uid=b.ges_bcam_uid) 
left join BD_HERRAMIENTAS.dbo.TabMotor_EstadoGestion SubEMotor
on  b.ges_estado_gst=SubEMotor.eges_id 
left join BD_HERRAMIENTAS.dbo.TabMotor_EstadoGestion EstMotor on 
SubEMotor.ejes_id_padre=EstMotor.eges_id
where Periodo=(select max(periodo) from BD_HERRAMIENTAS..TabMotor_Asignacion)
and a.Afiliado_Rut=@RutAfiliado
--and Tipo='Motor' 
and TipoAsignacion not in (2)
union all
select  distinct
		 CONVERT(VARCHAR,(select max(periodo) from BD_HERRAMIENTAS.dbo.TabMotor_Asignacion)) Periodo
		,a.RutEntidad Afiliado_Rut
		,'' Afiliado_Dv 
		,CASE WHEN a.CodCamp = 8 THEN 'TMC'
		WHEN A.CodCamp=6 THEN 'Gestión LM Pendientes'
		END Campania
		,b.ValorAttr Oferta
		,0 Prioridad
	    ,A.CodCamp TipoAsignacion
		,a.CodAsignacion id_Asign
		,EstMotor.Nombre EstadoGestion
		,SubEMotor.Nombre SubEstadoGestion
		,c.FechaCompromiso FComprometeGestion
		--INTO #ENGINE 
from BD_HERRAMIENTAS.engine.Asignacion A
INNER JOIN BD_HERRAMIENTAS.engine.AttrValores B
on A.CodAsignacion = B.CodAsignacion
left JOIN BD_HERRAMIENTAS.engine.Gestion C
on a.CodAsignacion=C.CodAsignacion and C.FechaAccion is not null and C.FechaAccion=(select max(xx.FechaAccion) from   BD_HERRAMIENTAS.engine.Gestion xx where xx.CodAsignacion=C.CodAsignacion)
left join BD_HERRAMIENTAS.engine.EstadoGestion SubEMotor
on  C.CodEstadoGestion=SubEMotor.CodEstado 
left join BD_HERRAMIENTAS.engine.EstadoGestion EstMotor on 
SubEMotor.CodEstPadre=EstMotor.CodEstado
where a.RutEntidad=@RutAfiliado
and A.CodCamp in (8)
AND B.CodAttr='MontoDevolAprox'
union all
select  distinct
         a.Periodo
		,a.Afiliado_Rut
		,a.Afiliado_Dv
		,case when a.TipoAsignacion = 2 then 'Normalización'
		end Campania
		,a.PreAprobadoFinal Oferta
		,a.Prioridad
		,a.TipoAsignacion
		,a.id_Asign
		,SubEMotor.eges_nombre  EstadoGestion
		,SubEMotor1.eges_nombre SubEstadoGestion
		,b.ges_fecha_compromete FComprometeGestion
		 from BD_HERRAMIENTAS..TabMotor_Asignacion A
		 left join BD_HERRAMIENTAS.dbo.TabMotor_Gestion B
         on a.id_Asign=b.ges_bcam_uid and b.ges_fecha_accion is not null and b.ges_fecha_accion=(select max(xx.ges_fecha_accion) from  BD_HERRAMIENTAS.dbo.TabMotor_Gestion xx where xx.ges_bcam_uid=b.ges_bcam_uid) 
		 left join BD_HERRAMIENTAS.dbo.TabMotor_EstadoGestion SubEMotor
	     on  left(b.ges_estado_gst,2)=SubEMotor.eges_id
		 left join BD_HERRAMIENTAS.dbo.TabMotor_EstadoGestion SubEMotor1
		 on right(right(left((b.ges_estado_gst),10),6),4)=SubEMotor1.eges_id 
		 where A.TipoAsignacion=2
		 and a.Afiliado_Rut=@RutAfiliado
		 and Periodo=(select max(periodo) from BD_HERRAMIENTAS..TabMotor_Asignacion)
) X
order by x.TipoAsignacion asc



---10614576
--Select distinct
--		 a.Periodo
--		,a.Afiliado_Rut
--		,a.Afiliado_Dv
--		,a.Campania
--		,a.Oferta
--		,case when convert (varchar,a.Prioridad) = '0' then ''
--		else
--		Prioridad
--		end Prioridad
--		,a.id_Asign
--		,a.Tipo
--		,a.TipoAsignacion
--		,d.eges_nombre EstadoMotor
--		,c.eges_nombre SubEstadoMotor
--		,b.ges_fecha_compromete 
--		--,g.Nombre
--		--,f.Nombre
--		--,e.FechaCompromiso
-- From scafi.Campañas A	
--	left join TabMotor_Gestion B
--	ON a.id_Asign = b.ges_bcam_uid and a.Tipo='Motor'
--	left join BD_HERRAMIENTAS..TabMotor_EstadoGestion C
--	on b.ges_estado_gst=c.eges_id and a.Tipo='Motor'
--	left join BD_HERRAMIENTAS..TabMotor_EstadoGestion D 
--	on c.ejes_id_padre=d.eges_id and a.Tipo='Motor'
-- where Afiliado_Rut=@RutAfiliado
-- and a.periodo=(select max(periodo) from scafi.Campañas )
--order by 	TipoAsignacion asc