IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[spMotor_BuscarAfiliadoScanCampanasHist]') AND type = 'P')
DROP PROCEDURE [mae].[spMotor_BuscarAfiliadoScanCampanasHist]
GO
CREATE procedure [mae].[spMotor_BuscarAfiliadoScanCampanasHist]
(
	@RutAfiliado int,
	@TipoAsignacion int
)
as
select  * from 
(
select distinct a.Periodo	
		,a.Afiliado_Rut
		,a.Afiliado_Dv
		,case when a.TipoAsignacion = 1 then 'Comercial'
		when a.TipoAsignacion=2 then 'Normalización'
		when a.TipoAsignacion=4 then 'Seguro Cesantía'
		end Campania
		,a.PreAprobadoFinal Oferta
		,a.Prioridad
		,a.TipoAsignacion
		,a.id_Asign
		,EstMotor.ejes_terminal EstadoTerminal
		,EstMotor.eges_nombre EstadoGestion
		,SubEMotor.eges_nombre SubEstadoGestion
		,b.ges_fecha_compromete FComprometeGestion
		,b.ges_fecha_accion FechaAccion
		,Dotacion.Nombre
		,b.ges_descripcion_gst Descripcion
		 from BD_HERRAMIENTAS..TabMotor_Asignacion A
			left JOIN BD_HERRAMIENTAS.dbo.TabMotor_Gestion B 
			on a.id_Asign=b.ges_bcam_uid and b.ges_fecha_accion is not null --and b.ges_fecha_accion=(select (xx.ges_fecha_accion) from  BD_HERRAMIENTAS.dbo.TabMotor_Gestion xx where xx.ges_bcam_uid=b.ges_bcam_uid) 
			left join BD_HERRAMIENTAS.dbo.TabMotor_EstadoGestion SubEMotor
			on  b.ges_estado_gst=SubEMotor.eges_id 
			left join BD_HERRAMIENTAS.dbo.TabMotor_EstadoGestion EstMotor on 
			SubEMotor.ejes_id_padre=EstMotor.eges_id
			inner join BD_HERRAMIENTAS.dbo.TabMotor_Dotacion Dotacion
			on b.ges_ejecutivo_rut=Dotacion.Rut
			where a.Periodo=(select max(periodo) from BD_HERRAMIENTAS..TabMotor_Asignacion)
			and a.Afiliado_Rut=@RutAfiliado
			--and Tipo='Motor' 
			and a.TipoAsignacion not in (2)
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
		,'' EstadoTerminal
		,EstMotor.Nombre EstadoGestion
		,SubEMotor.Nombre SubEstadoGestion
		,c.FechaCompromiso FComprometeGestion
		,c.FechaAccion FechaAccion
		,Dotacion.Nombre
		,c.NotaGestion Descripcion
		--INTO #ENGINE 
from BD_HERRAMIENTAS.engine.Asignacion A
	INNER JOIN BD_HERRAMIENTAS.engine.AttrValores B
	on A.CodAsignacion = B.CodAsignacion
	left JOIN BD_HERRAMIENTAS.engine.Gestion C
	on a.CodAsignacion=C.CodAsignacion and C.FechaAccion is not null --and C.FechaAccion=(select (xx.FechaAccion) from   BD_HERRAMIENTAS.engine.Gestion xx where xx.CodAsignacion=C.CodAsignacion)
	left join BD_HERRAMIENTAS.engine.EstadoGestion SubEMotor
	on  C.CodEstadoGestion=SubEMotor.CodEstado 
	left join BD_HERRAMIENTAS.engine.EstadoGestion EstMotor on 
	SubEMotor.CodEstPadre=EstMotor.CodEstado
	inner join BD_HERRAMIENTAS.dbo.TabMotor_Dotacion Dotacion
	on c.RutEjecutivo=Dotacion.Rut
where a.RutEntidad=@RutAfiliado
and A.CodCamp in (6,8)
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
		,''EstadoTerminal
		,SubEMotor.eges_nombre  EstadoGestion
		,SubEMotor1.eges_nombre SubEstadoGestion
		,b.ges_fecha_compromete FComprometeGestion
		 ,b.ges_fecha_accion FechaAccion
		,Dotacion.Nombre
		,b.ges_descripcion_gst Descripcion
		 from BD_HERRAMIENTAS..TabMotor_Asignacion A
		 left join BD_HERRAMIENTAS.dbo.TabMotor_Gestion B
         on a.id_Asign=b.ges_bcam_uid and b.ges_fecha_accion is not null --and b.ges_fecha_accion=(select (xx.ges_fecha_accion) from  BD_HERRAMIENTAS.dbo.TabMotor_Gestion xx where xx.ges_bcam_uid=b.ges_bcam_uid) 
		 left join BD_HERRAMIENTAS.dbo.TabMotor_EstadoGestion SubEMotor
	     on  left(b.ges_estado_gst,2)=SubEMotor.eges_id
		 left join BD_HERRAMIENTAS.dbo.TabMotor_EstadoGestion SubEMotor1
		 on right(right(left((b.ges_estado_gst),10),6),4)=SubEMotor1.eges_id 
		 inner join BD_HERRAMIENTAS.dbo.TabMotor_Dotacion Dotacion
		 on b.ges_ejecutivo_rut=Dotacion.Rut
		 where A.TipoAsignacion=2
		 and a.Afiliado_Rut=@RutAfiliado
		 and a.Periodo=(select max(periodo) from BD_HERRAMIENTAS..TabMotor_Asignacion)
) X
order by x.FechaAccion desc
--order by x.TipoAsignacion desc
--select distinct * from 
--(
--select distinct a.Periodo
--		,a.Afiliado_Rut
--		,a.Afiliado_Dv
--		,a.Campania
--		,a.Oferta
--		,a.Prioridad
--		,a.TipoAsignacion
--		,a.id_Asign
--		,EstMotor.ejes_terminal EstadoTerminal
--		,EstMotor.eges_nombre EstadoGestion
--		,SubEMotor.eges_nombre SubEstadoGestion
--		,b.ges_fecha_compromete FComprometeGestion
--		,b.ges_fecha_accion FechaAccion
--		,Dotacion.Nombre
--		,b.ges_descripcion_gst Descripcion
--		 from BD_HERRAMIENTAS.scafi.Campañas A
--left JOIN BD_HERRAMIENTAS.dbo.TabMotor_Gestion B 
--on a.id_Asign=b.ges_bcam_uid and b.ges_fecha_accion is not null and b.ges_fecha_accion=(select max(xx.ges_fecha_accion) from  BD_HERRAMIENTAS.dbo.TabMotor_Gestion xx where xx.ges_bcam_uid=b.ges_bcam_uid) 
--left join BD_HERRAMIENTAS.dbo.TabMotor_EstadoGestion SubEMotor
--on  b.ges_estado_gst=SubEMotor.eges_id 
--left join BD_HERRAMIENTAS.dbo.TabMotor_EstadoGestion EstMotor on 
--SubEMotor.ejes_id_padre=EstMotor.eges_id
--inner join BD_HERRAMIENTAS.dbo.TabMotor_Dotacion Dotacion
--on b.ges_ejecutivo_rut=Dotacion.Rut
--where a.Periodo=(select max(periodo) from BD_HERRAMIENTAS.scafi.Campañas)
--and a.Afiliado_Rut=@RutAfiliado
--and a.Tipo='Motor'
--and a.TipoAsignacion=@TipoAsignacion

--union all
--select distinct a.Periodo
--		,a.Afiliado_Rut
--		,a.Afiliado_Dv
--		,a.Campania
--		,a.Oferta
--		,a.Prioridad
--		,a.TipoAsignacion
--		,a.id_Asign
--		,convert(varchar,EstMotor.EsTerminal) EstadoTerminal
--		,EstMotor.Nombre EstadoGestion
--		,SubEMotor.Nombre SubEstadoGestion
--		,b.FechaCompromiso FComprometeGestion
--		,b.FechaAccion FechaAccion
--		,Dotacion.Nombre
--		,b.NotaGestion Descripcion
--		 from BD_HERRAMIENTAS.scafi.Campañas A
--left JOIN BD_HERRAMIENTAS.engine.Gestion B
--on a.id_Asign=b.CodAsignacion and b.FechaAccion is not null and b.FechaAccion=(select max(xx.FechaAccion) from   BD_HERRAMIENTAS.engine.Gestion xx where xx.CodAsignacion=b.CodAsignacion)
--left join BD_HERRAMIENTAS.engine.EstadoGestion SubEMotor
--on  b.CodEstadoGestion=SubEMotor.CodEstado 
--left join BD_HERRAMIENTAS.engine.EstadoGestion EstMotor on 
--SubEMotor.CodEstPadre=EstMotor.CodEstado
--inner join BD_HERRAMIENTAS.dbo.TabMotor_Dotacion Dotacion
--on b.RutEjecutivo=Dotacion.Rut
--where a.Periodo=(select max(periodo) from BD_HERRAMIENTAS.scafi.Campañas)
--and a.Afiliado_Rut=@RutAfiliado
--and a.TipoAsignacion=@TipoAsignacion
-- and a.Tipo='Engine'


--) X
--order by x.TipoAsignacion asc