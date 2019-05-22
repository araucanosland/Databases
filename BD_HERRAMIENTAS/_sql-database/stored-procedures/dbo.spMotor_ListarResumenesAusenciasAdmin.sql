IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ListarResumenesAusenciasAdmin]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ListarResumenesAusenciasAdmin]
GO
CREATE PROCEDURE [dbo].[spMotor_ListarResumenesAusenciasAdmin]
(
	@PERIODO INT,
	@CODSUCURSAL INT
)
AS
BEGIN
	/*PARAMETROS*/
	--DECLARE @PERIODO INT = 201707
	DECLARE @COD_OFICINA INT
	--DECLARE @RUT_EJEC VARCHAR(50) = security.fnSca_ObtenerRutByToken(@TOKEN)
	DECLARE @PeriodoActual INT = dbo.fnMotor_ObtenerPeriodoActual()

	/*VARIALBES*/
	DECLARE @TOTAL_OFICINA FLOAT = 0
	DECLARE @TOTAL_AUSENCIAS FLOAT = 0


		IF @PERIODO > @PeriodoActual
		BEGIN
			SET @PERIODO = @PeriodoActual;
		END


	--SELECT @COD_OFICINA = Cod_Sucursal
	--FROM TabMotor_Dotacion 
	--where Rut = @RUT_EJEC
	--and Periodo = @PERIODO



	/*TOTAL OFICINA*/
	SELECT @TOTAL_OFICINA = COUNT(*)
	FROM dbo.TabMotor_Dotacion
	WHERE Cod_Sucursal = @CODSUCURSAL
	AND Periodo = @PERIODO


	if object_id('tempdb..#ResumenAusencias') is not null
	drop table  #ResumenAusencias;

	/* RESUMENES TOTALES -*/
	SELECT CONVERT(VARCHAR(50),'ausentes') ClaseAusencia, COUNT(*) Numero, CONVERT(INT,ROUND(((COUNT(*) / @TOTAL_OFICINA) * 100), 0 )) Porcentaje--@TOTAL_AUSENCIAS = COUNT(*)
	into #ResumenAusencias
	FROM dbo.TabMotor_Ausencia a
	inner join dbo.TabMotor_Dotacion b ON a.ejec_rut = b.Rut and b.Periodo = @PERIODO
	inner join dbo.TabMotor_TipoAusencia c ON a.tipo_ausencia_id = c.taus_id
	WHERE (	(c.taus_es_rango_fechas = 1 AND CONVERT(DATE,GETDATE()) BETWEEN CONVERT(DATE,aus_fecha_inicio) and CONVERT(DATE,aus_fecha_fin)) OR 
					(c.taus_es_rango_fechas = 0 AND CONVERT(DATE,GETDATE()) >= CONVERT(DATE,aus_fecha_inicio)))
	AND B.Cod_Sucursal = @CODSUCURSAL


	insert into #ResumenAusencias
	SELECT 'activos' ClaseAusencia, @TOTAL_OFICINA - COUNT(*) N, ROUND(100-((COUNT(*) / @TOTAL_OFICINA) * 100), 0 ) P--@TOTAL_AUSENCIAS = COUNT(*)
	FROM dbo.TabMotor_Ausencia a
	inner join dbo.TabMotor_Dotacion b ON a.ejec_rut = b.Rut and b.Periodo = @PERIODO
	inner join dbo.TabMotor_TipoAusencia c ON a.tipo_ausencia_id = c.taus_id
	WHERE (	(c.taus_es_rango_fechas = 1 AND CONVERT(DATE,GETDATE()) BETWEEN CONVERT(DATE,aus_fecha_inicio) and CONVERT(DATE,aus_fecha_fin)) OR 
					(c.taus_es_rango_fechas = 0 AND CONVERT(DATE,GETDATE()) >= CONVERT(DATE,aus_fecha_inicio)))
	AND B.Cod_Sucursal = @CODSUCURSAL


	insert into #ResumenAusencias
	SELECT REPLACE(c.taus_clase_color,'ausencia-','') ClaseAusencia, COUNT(*) N, ROUND(((COUNT(*) / @TOTAL_OFICINA) * 100), 0 ) P
	FROM dbo.TabMotor_Ausencia a
	inner join dbo.TabMotor_Dotacion b ON a.ejec_rut = b.Rut and b.Periodo = @PERIODO
	inner join dbo.TabMotor_TipoAusencia c ON a.tipo_ausencia_id = c.taus_id
	WHERE (	(c.taus_es_rango_fechas = 1 AND CONVERT(DATE,GETDATE()) BETWEEN CONVERT(DATE,aus_fecha_inicio) and CONVERT(DATE,aus_fecha_fin)) OR 
					(c.taus_es_rango_fechas = 0 AND CONVERT(DATE,GETDATE()) >= CONVERT(DATE,aus_fecha_inicio)))
	AND B.Cod_Sucursal = @CODSUCURSAL
	GROUP BY c.taus_clase_color

	insert into #ResumenAusencias
	select distinct REPLACE(taus_clase_color,'ausencia-','') Grupo, 0, 0
	from dbo.TabMotor_TipoAusencia 
	where REPLACE(taus_clase_color,'ausencia-','') not in (select ClaseAusencia from #ResumenAusencias)


	select * from #ResumenAusencias

	drop table #ResumenAusencias

END