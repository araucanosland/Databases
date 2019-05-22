IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ListaSucursalDotAdmin]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ListaSucursalDotAdmin]
GO
--exec [dbo].[spMotor_ListaSucursalDotAdmin]
CREATE PROCEDURE [dbo].[spMotor_ListaSucursalDotAdmin]

AS
BEGIN

	SET NOCOUNT ON;


	--Select Distinct Cod_Sucursal CodOficina
	--				,Sucursal 
	--				From BD_HERRAMIENTAS.dbo.TabMotor_Dotacion
	--Where Periodo=(Select max(periodo) From BD_HERRAMIENTAS.dbo.TabMotor_Dotacion)
	--And Cod_Sucursal not in (0,99) 
	--And Cod_Sucursal<555
	--order by Cod_Sucursal asc
	


	if object_id('tempdb..#TotalOficinas') is not null
	drop table  #TotalOficinas;
	/*TOTAL OFICINA*/
	SELECT Cod_Sucursal,Sucursal,COUNT(*) TotalEjecutivos
	into #TotalOficinas
	FROM dbo.TabMotor_Dotacion
	WHERE Periodo = 201802 
	and Cod_Sucursal not in (0,99,555,999)
	group by Cod_Sucursal,Sucursal
	order by Cod_Sucursal

	if object_id('tempdb..#TotalDetalle') is not null
	drop table  #TotalDetalle;
	--DETALLE
	select Cod_Sucursal, replace(taus_clase_color,'ausencia-','') Motivo, count(*) Faltan
	into #TotalDetalle
	FROM dbo.TabMotor_Ausencia a
	inner join dbo.TabMotor_Dotacion b ON a.ejec_rut = b.Rut and b.Periodo = 201802
	inner join dbo.TabMotor_TipoAusencia c ON a.tipo_ausencia_id = c.taus_id
	where Cod_Sucursal not in (0,99,555,999)
	and (	(c.taus_es_rango_fechas = 1 AND CONVERT(DATE,GETDATE()) BETWEEN CONVERT(DATE,aus_fecha_inicio) and CONVERT(DATE,aus_fecha_fin)) OR 
					(c.taus_es_rango_fechas = 0 AND CONVERT(DATE,GETDATE()) >= CONVERT(DATE,aus_fecha_inicio)))
	group by Cod_Sucursal, taus_clase_color
	order by Cod_Sucursal asc


	--RESUMEN
		if object_id('tempdb..#TotalResumen') is not null
	drop table  #TotalResumen;
	select Cod_Sucursal, count(*) Faltan
	into #TotalResumen
	FROM dbo.TabMotor_Ausencia a
	inner join dbo.TabMotor_Dotacion b ON a.ejec_rut = b.Rut and b.Periodo = 201802
	inner join dbo.TabMotor_TipoAusencia c ON a.tipo_ausencia_id = c.taus_id
	where Cod_Sucursal not in (0,99,555,999)
	and (	(c.taus_es_rango_fechas = 1 AND CONVERT(DATE,GETDATE()) BETWEEN CONVERT(DATE,aus_fecha_inicio) and CONVERT(DATE,aus_fecha_fin)) OR 
					(c.taus_es_rango_fechas = 0 AND CONVERT(DATE,GETDATE()) >= CONVERT(DATE,aus_fecha_inicio)))
	group by Cod_Sucursal
	order by Cod_Sucursal asc

	select a.Cod_Sucursal,a.Sucursal,
	isnull((a.TotalEjecutivos-b.Faltan),0) NumeroActivo,
	isnull((((a.TotalEjecutivos-b.Faltan)*100)/a.TotalEjecutivos),0) PorcentajeActivo,
	isnull(c.FaltanLicencias,0) NroLicencia,
	isnull(((((a.TotalEjecutivos-b.Faltan)*100)/a.TotalEjecutivos)*c.FaltanLicencias)/(a.TotalEjecutivos-b.Faltan),0) PorcentajeLicencia,
	isnull(d.FaltaPermiso,0) NroPermiso,
	isnull(((((a.TotalEjecutivos-b.Faltan)*100)/a.TotalEjecutivos)*d.FaltaPermiso)/(a.TotalEjecutivos-b.Faltan),0) PorcentajePermiso,
	isnull(e.FaltanVacaciones,0)NroVacaciones,
	isnull(((((a.TotalEjecutivos-b.Faltan)*100)/a.TotalEjecutivos)*e.FaltanVacaciones)/(a.TotalEjecutivos-b.Faltan),0) PorcentajeVacaciones,
	isnull(f.FaltaCapacitacion,0) NroCapacitacion,
	isnull(((((a.TotalEjecutivos-b.Faltan)*100)/a.TotalEjecutivos)*f.FaltaCapacitacion)/(a.TotalEjecutivos-b.Faltan),0) PorcentajeCapacitacion,
	isnull(g.FaltanComision,0) NroComision,
	isnull(((((a.TotalEjecutivos-b.Faltan)*100)/a.TotalEjecutivos)*g.FaltanComision)/(a.TotalEjecutivos-b.Faltan),0) PorcentajeComision,
	isnull(h.FaltanDesvin,0) NroDesvinculacion,
	isnull(((((a.TotalEjecutivos-b.Faltan)*100)/a.TotalEjecutivos)*h.FaltanDesvin)/(a.TotalEjecutivos-b.Faltan),0) PorcentajeDesvinculacion,
	isnull(b.Faltan,0) NroTotal,
	isnull(((((a.TotalEjecutivos-b.Faltan)*100)/a.TotalEjecutivos)*b.Faltan)/(a.TotalEjecutivos-b.Faltan),0) PorcentajeTotal
	from #TotalOficinas A
	left join #TotalResumen B on a.Cod_Sucursal=b.Cod_Sucursal
	left join (select Cod_Sucursal,Faltan FaltanLicencias from #TotalDetalle
    where Motivo='licencia') C on a.Cod_Sucursal=c.Cod_Sucursal
	Left Join (select Cod_Sucursal,Faltan FaltaPermiso  from #TotalDetalle
	where Motivo='permiso') D ON a.Cod_Sucursal=d.Cod_Sucursal
	Left Join (select Cod_Sucursal,Faltan FaltanVacaciones from #TotalDetalle
    where Motivo='vacaciones') E on a.Cod_Sucursal=e.Cod_Sucursal
	Left Join (select Cod_Sucursal,Faltan FaltaCapacitacion from #TotalDetalle
	where Motivo='capacitacion') F on a.Cod_Sucursal=f.Cod_Sucursal
	Left Join (select Cod_Sucursal,Faltan FaltanComision from #TotalDetalle
	where Motivo='comision') G on a.Cod_Sucursal=g.Cod_Sucursal
	Left Join(select Cod_Sucursal,Faltan FaltanDesvin from #TotalDetalle
    where Motivo='desvinculacion') H on a.Cod_Sucursal=h.Cod_Sucursal





END