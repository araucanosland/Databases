IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Asignacion_ListarByEjecutivoPag]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Asignacion_ListarByEjecutivoPag]
GO
CREATE PROCEDURE [dbo].[spMotor_Asignacion_ListarByEjecutivoPag]
	@Periodo int ,
	@TipoCamp int,
	@Estado int=0,
	@SubEstado int = 0,
	@CausaBasal int = 0,
	@Consecuencia int = 0,
	@Prioridad varchar(20) = '',
	@Segmento varchar(50) = '',
	@Tipo varchar(100) = '',
	@RutAfiliado varchar(50) = '',
	@Offset int = 0,
	@Limit int = 30,
	@Sort varchar(100),
	@Orden varchar(5),
	@TokenEjecutivo varchar(40)
AS
BEGIN
  -- routine body goes here, e.g.

	declare @RutEjec VARCHAR(50) = security.fnSca_ObtenerRutByToken(@TokenEjecutivo)
	declare @OficinaEjec INT = security.fnSca_ObtenerOficinaByToken(@TokenEjecutivo)
	declare @TotalReg INT = 0



	IF @TipoCamp = 1 
	BEGIN
			/*TOTALES*/
			select @TotalReg = count(*)
			from (
							select a.id_Asign, 
														a.Periodo, 
														a.Afiliado_Rut, 
														a.Afiliado_Dv, 
														a.Nombre, 
														a.Apellido,
														a.Empresa_Rut,
														a.Empresa_Dv,
														a.Empresa, 
														a.Holding,
														a.Segmento,
														a.PensionadoFFAA,
														a.Ejec_Asignacion,
														a.PreAprobadoFinal,
														a.TipoAsignacion,
														a.Prioridad,
														a.TipoCampania,
														a.Cuadrante,
														a.OfertaTexto,
														a.TipoDerivacion,

														b.ges_bcam_uid,
														b.ges_fecha_accion,
														b.ges_fecha_compromete,
														b.ges_descripcion_gst,
														b.ges_estado_gst,
														b.ges_ejecutivo_rut,
														b.ges_oficina--,
														--ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut desc) pos
							from dbo.TabMotor_Asignacion a with(index(idx_ListarByEjecutivo2))
							outer apply(
								select * 
								from dbo.TabMotor_Gestion xx	with(index(DX4))
								where ges_bcam_uid = a.id_Asign
								and ges_fecha_accion = (select max(ges_fecha_accion) 
																				from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) 
																				where xy.ges_bcam_uid = xx.ges_bcam_uid)
							) b
							where a.periodo=@Periodo
							and a.Ejec_Asignacion = @RutEjec and a.TipoAsignacion = 1
							and ((@SubEstado > 0 and ges_estado_gst = @SubEstado) or (@SubEstado = -1 and ges_estado_gst is null) or @SubEstado = 0)
							and ((@Estado > 0 and LEFT(ges_estado_gst,1) = @Estado) or (@Estado = -1 and ges_estado_gst is null) or @Estado = 0)
							and ((@Prioridad <> '' and Prioridad = @Prioridad) or (@Prioridad = ''))
							and ((@Segmento <> '' and UPPER(Segmento) = UPPER(@Segmento)) or (@Segmento = ''))
							and ((@Tipo <> '' and UPPER(TipoCampania) = UPPER(@Tipo)) or (@Tipo = ''))
							and ((@RutAfiliado <> '' and CONVERT(VARCHAR(20),Afiliado_Rut)+'-'+Afiliado_Dv = REPLACE(@RutAfiliado,'.','')) or (@RutAfiliado = ''))
							union
							select a.id_Asign, 
														a.Periodo, 
														a.Afiliado_Rut, 
														a.Afiliado_Dv, 
														a.Nombre, 
														a.Apellido,
														a.Empresa_Rut,
														a.Empresa_Dv,
														a.Empresa, 
														a.Holding,
														a.Segmento,
														a.PensionadoFFAA,
														a.Ejec_Asignacion,
														a.PreAprobadoFinal,
														a.TipoAsignacion,
														a.Prioridad,
														a.TipoCampania,
														a.Cuadrante,
														a.OfertaTexto,
														a.TipoDerivacion,

														b.ges_bcam_uid,
														b.ges_fecha_accion,
														b.ges_fecha_compromete,
														b.ges_descripcion_gst,
														b.ges_estado_gst,
														b.ges_ejecutivo_rut,
														b.ges_oficina--,
														--ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut desc) pos
							from dbo.TabMotor_Asignacion a with(index(idx_guardaGestion))
							outer apply(
								select * 
								from dbo.TabMotor_Gestion xx	with(index(DX4))
								where ges_bcam_uid = a.id_Asign
								and ges_fecha_accion = (select max(ges_fecha_accion) 
																				from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) 
																				where xy.ges_bcam_uid = xx.ges_bcam_uid)
							) b
							where a.periodo=@Periodo
							and a.id_Asign in (select zz.ges_bcam_uid from dbo.TabMotor_Gestion zz with(index(IDX_RUT)) where zz.ges_ejecutivo_rut = @RutEjec) and a.TipoAsignacion in (1,5) and a.Ejec_Asignacion <> @RutEjec
							and ((@SubEstado > 0 and ges_estado_gst = @SubEstado) or (@SubEstado = -1 and ges_estado_gst is null) or @SubEstado = 0)
							and ((@Estado > 0 and LEFT(ges_estado_gst,1) = @Estado) or (@Estado = -1 and ges_estado_gst is null) or @Estado = 0)
							and ((@Prioridad <> '' and Prioridad = @Prioridad) or (@Prioridad = ''))
							and ((@Segmento <> '' and UPPER(Segmento) = UPPER(@Segmento)) or (@Segmento = ''))
							and ((@Tipo <> '' and UPPER(TipoCampania) = UPPER(@Tipo)) or (@Tipo = ''))
							and ((@RutAfiliado <> '' and CONVERT(VARCHAR(20),Afiliado_Rut)+'-'+Afiliado_Dv = REPLACE(@RutAfiliado,'.','')) or (@RutAfiliado = ''))
						) c
						
						
			

			/*DATA*/
			/*ORDEN POR RUT ASC*/
			IF @Sort = 'Seguimiento.Afiliado_Rut' and @Orden = 'asc'
			BEGIN
				select * from (
						select * , ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut asc) pos, @TotalReg as total_reg

						from (
							select a.id_Asign, 
														a.Periodo, 
														a.Afiliado_Rut, 
														a.Afiliado_Dv, 
														a.Nombre, 
														a.Apellido,
														a.Empresa_Rut,
														a.Empresa_Dv,
														a.Empresa, 
														a.Holding,
														a.Segmento,
														a.PensionadoFFAA,
														a.Ejec_Asignacion,
														a.PreAprobadoFinal,
														a.TipoAsignacion,
														a.Prioridad,
														a.TipoCampania,
														a.Cuadrante,
														a.OfertaTexto,
														a.TipoDerivacion,

														b.ges_bcam_uid,
														b.ges_fecha_accion,
														b.ges_fecha_compromete,
														b.ges_descripcion_gst,
														b.ges_estado_gst,
														b.ges_ejecutivo_rut,
														b.ges_oficina--,
														--ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut desc) pos
							from dbo.TabMotor_Asignacion a with(index(idx_ListarByEjecutivo2))
							outer apply(
								select * 
								from dbo.TabMotor_Gestion xx	with(index(DX4))
								where ges_bcam_uid = a.id_Asign
								and ges_fecha_accion = (select max(ges_fecha_accion) 
																				from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) 
																				where xy.ges_bcam_uid = xx.ges_bcam_uid)
							) b
							where a.periodo=@Periodo
							and a.Ejec_Asignacion = @RutEjec and a.TipoAsignacion = 1
							and ((@SubEstado > 0 and ges_estado_gst = @SubEstado) or (@SubEstado = -1 and ges_estado_gst is null) or @SubEstado = 0)
							and ((@Estado > 0 and LEFT(ges_estado_gst,1) = @Estado) or (@Estado = -1 and ges_estado_gst is null) or @Estado = 0)
							and ((@Prioridad <> '' and Prioridad = @Prioridad) or (@Prioridad = ''))
							and ((@Segmento <> '' and UPPER(Segmento) = UPPER(@Segmento)) or (@Segmento = ''))
							and ((@Tipo <> '' and UPPER(TipoCampania) = UPPER(@Tipo)) or (@Tipo = ''))
							and ((@RutAfiliado <> '' and CONVERT(VARCHAR(20),Afiliado_Rut)+'-'+Afiliado_Dv = REPLACE(@RutAfiliado,'.','')) or (@RutAfiliado = ''))
							union
							select a.id_Asign, 
														a.Periodo, 
														a.Afiliado_Rut, 
														a.Afiliado_Dv, 
														a.Nombre, 
														a.Apellido,
														a.Empresa_Rut,
														a.Empresa_Dv,
														a.Empresa, 
														a.Holding,
														a.Segmento,
														a.PensionadoFFAA,
														a.Ejec_Asignacion,
														a.PreAprobadoFinal,
														a.TipoAsignacion,
														a.Prioridad,
														a.TipoCampania,
														a.Cuadrante,
														a.OfertaTexto,
														a.TipoDerivacion,

														b.ges_bcam_uid,
														b.ges_fecha_accion,
														b.ges_fecha_compromete,
														b.ges_descripcion_gst,
														b.ges_estado_gst,
														b.ges_ejecutivo_rut,
														b.ges_oficina--,
														--ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut desc) pos
							from dbo.TabMotor_Asignacion a with(index(idx_guardaGestion))
							outer apply(
								select * 
								from dbo.TabMotor_Gestion xx	with(index(DX4))
								where ges_bcam_uid = a.id_Asign
								and ges_fecha_accion = (select max(ges_fecha_accion) 
																				from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) 
																				where xy.ges_bcam_uid = xx.ges_bcam_uid)
							) b
							where a.periodo=@Periodo
							and a.id_Asign in (select zz.ges_bcam_uid from dbo.TabMotor_Gestion zz with(index(IDX_RUT)) where zz.ges_ejecutivo_rut = @RutEjec) and a.TipoAsignacion in (1,5) and a.Ejec_Asignacion <> @RutEjec
							and ((@SubEstado > 0 and ges_estado_gst = @SubEstado) or (@SubEstado = -1 and ges_estado_gst is null) or @SubEstado = 0)
							and ((@Estado > 0 and LEFT(ges_estado_gst,1) = @Estado) or (@Estado = -1 and ges_estado_gst is null) or @Estado = 0)
							and ((@Prioridad <> '' and Prioridad = @Prioridad) or (@Prioridad = ''))
							and ((@Segmento <> '' and UPPER(Segmento) = UPPER(@Segmento)) or (@Segmento = ''))
							and ((@Tipo <> '' and UPPER(TipoCampania) = UPPER(@Tipo)) or (@Tipo = ''))
							and ((@RutAfiliado <> '' and CONVERT(VARCHAR(20),Afiliado_Rut)+'-'+Afiliado_Dv = REPLACE(@RutAfiliado,'.','')) or (@RutAfiliado = ''))
						) c
						) d
						where pos between @Offset+1 and @Offset + @Limit
						
			END
		
			/*ORDEN POR RUT DESC*/
			ELSE IF @Sort = 'Seguimiento.Afiliado_Rut' and @Orden = 'desc'
			BEGIN 
					select * from (
						select * , ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut desc) pos, @TotalReg as total_reg

						from (
							select a.id_Asign, 
														a.Periodo, 
														a.Afiliado_Rut, 
														a.Afiliado_Dv, 
														a.Nombre, 
														a.Apellido,
														a.Empresa_Rut,
														a.Empresa_Dv,
														a.Empresa, 
														a.Holding,
														a.Segmento,
														a.PensionadoFFAA,
														a.Ejec_Asignacion,
														a.PreAprobadoFinal,
														a.TipoAsignacion,
														a.Prioridad,
														a.TipoCampania,
														a.Cuadrante,
														a.OfertaTexto,
														a.TipoDerivacion,

														b.ges_bcam_uid,
														b.ges_fecha_accion,
														b.ges_fecha_compromete,
														b.ges_descripcion_gst,
														b.ges_estado_gst,
														b.ges_ejecutivo_rut,
														b.ges_oficina--,
														--ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut desc) pos
							from dbo.TabMotor_Asignacion a with(index(idx_ListarByEjecutivo2))
							outer apply(
								select * 
								from dbo.TabMotor_Gestion xx	with(index(DX4))
								where ges_bcam_uid = a.id_Asign
								and ges_fecha_accion = (select max(ges_fecha_accion) 
																				from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) 
																				where xy.ges_bcam_uid = xx.ges_bcam_uid)
							) b
							where a.periodo=@Periodo
							and a.Ejec_Asignacion = @RutEjec and a.TipoAsignacion = 1
							and ((@SubEstado <> 0 and ges_estado_gst = @SubEstado) or @SubEstado = 0)
							and ((@Estado > 0 and LEFT(ges_estado_gst,1) = @Estado) or (@Estado = -1 and ges_estado_gst is null) or @Estado = 0)
							and ((@Prioridad <> '' and Prioridad = @Prioridad) or (@Prioridad = ''))
							and ((@Segmento <> '' and UPPER(Segmento) = UPPER(@Segmento)) or (@Segmento = ''))
							and ((@Tipo <> '' and UPPER(TipoCampania) = UPPER(@Tipo)) or (@Tipo = ''))
							and ((@RutAfiliado <> '' and CONVERT(VARCHAR(20),Afiliado_Rut)+'-'+Afiliado_Dv = REPLACE(@RutAfiliado,'.','')) or (@RutAfiliado = ''))
							union
							select a.id_Asign, 
														a.Periodo, 
														a.Afiliado_Rut, 
														a.Afiliado_Dv, 
														a.Nombre, 
														a.Apellido,
														a.Empresa_Rut,
														a.Empresa_Dv,
														a.Empresa, 
														a.Holding,
														a.Segmento,
														a.PensionadoFFAA,
														a.Ejec_Asignacion,
														a.PreAprobadoFinal,
														a.TipoAsignacion,
														a.Prioridad,
														a.TipoCampania,
														a.Cuadrante,
														a.OfertaTexto,
														a.TipoDerivacion,

														b.ges_bcam_uid,
														b.ges_fecha_accion,
														b.ges_fecha_compromete,
														b.ges_descripcion_gst,
														b.ges_estado_gst,
														b.ges_ejecutivo_rut,
														b.ges_oficina--,
														--ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut desc) pos
							from dbo.TabMotor_Asignacion a with(index(idx_guardaGestion))
							outer apply(
								select * 
								from dbo.TabMotor_Gestion xx	with(index(DX4))
								where ges_bcam_uid = a.id_Asign
								and ges_fecha_accion = (select max(ges_fecha_accion) 
																				from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) 
																				where xy.ges_bcam_uid = xx.ges_bcam_uid)
							) b
							where a.periodo=@Periodo
							and a.id_Asign in (select zz.ges_bcam_uid from dbo.TabMotor_Gestion zz with(index(IDX_RUT)) where zz.ges_ejecutivo_rut = @RutEjec) and a.TipoAsignacion in (1,5) and a.Ejec_Asignacion <> @RutEjec
							and ((@SubEstado > 0 and ges_estado_gst = @SubEstado) or (@SubEstado = -1 and ges_estado_gst is null) or @SubEstado = 0)
							and ((@Estado > 0 and LEFT(ges_estado_gst,1) = @Estado) or (@Estado = -1 and ges_estado_gst is null) or @Estado = 0)
							and ((@Prioridad <> '' and Prioridad = @Prioridad) or (@Prioridad = ''))
							and ((@Segmento <> '' and UPPER(Segmento) = UPPER(@Segmento)) or (@Segmento = ''))
							and ((@Tipo <> '' and UPPER(TipoCampania) = UPPER(@Tipo)) or (@Tipo = ''))
							and ((@RutAfiliado <> '' and CONVERT(VARCHAR(20),Afiliado_Rut)+'-'+Afiliado_Dv = REPLACE(@RutAfiliado,'.','')) or (@RutAfiliado = ''))
						) c
						) d
						where pos between @Offset+1 and @Offset + @Limit
			END
			
 END

	ELSE IF @TipoCamp = 2
	BEGIN
		/*TOTALES*/
			select @TotalReg = count(*)
			from (
							select a.id_Asign, 
														a.Periodo, 
														a.Afiliado_Rut, 
														a.Afiliado_Dv, 
														a.Nombre, 
														a.Apellido,
														a.Empresa_Rut,
														a.Empresa_Dv,
														a.Empresa, 
														a.Holding,
														a.Segmento,
														a.PensionadoFFAA,
														a.Ejec_Asignacion,
														a.PreAprobadoFinal,
														a.TipoAsignacion,
														a.Prioridad,
														a.TipoCampania,
														a.Cuadrante,
														a.OfertaTexto,
														a.TipoDerivacion,

														b.ges_bcam_uid,
														b.ges_fecha_accion,
														b.ges_fecha_compromete,
														b.ges_descripcion_gst,
														b.ges_estado_gst,
														b.ges_ejecutivo_rut,
														b.ges_oficina
							from dbo.TabMotor_Asignacion a with(index(idx_ListarByEjecutivo2))
							outer apply(
								select * , 
										CASE WHEN LEN(ges_estado_gst) = 10 THEN left(ges_estado_gst,2) ELSE left(ges_estado_gst,1) END CausaBasal,
										CASE WHEN LEN(ges_estado_gst) = 10 THEN substring(ges_estado_gst,3,4) ELSE substring(ges_estado_gst,2,4) END Consecuencia,
										CASE WHEN LEN(ges_estado_gst) = 10 THEN substring(ges_estado_gst,7,4) ELSE substring(ges_estado_gst,6,4) END Estado
								from dbo.TabMotor_Gestion xx	with(index(DX4))
								where ges_bcam_uid = a.id_Asign
								and ges_fecha_accion = (select max(ges_fecha_accion) 
																				from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) 
																				where xy.ges_bcam_uid = xx.ges_bcam_uid)
							) b
							where a.periodo=@Periodo
							and a.Ejec_Asignacion = @RutEjec and a.TipoAsignacion = 2
							and ((@Prioridad <> '' and Prioridad = @Prioridad) or (@Prioridad = ''))
							and ((@RutAfiliado <> '' and CONVERT(VARCHAR(20),Afiliado_Rut)+'-'+Afiliado_Dv = REPLACE(@RutAfiliado,'.','')) or (@RutAfiliado = ''))
							and ((@CausaBasal > 0 and CausaBasal = @CausaBasal) or (@CausaBasal = -1 and CausaBasal is null) or @CausaBasal = 0)
							and ((@Consecuencia > 0 and Consecuencia = @Consecuencia) or (@Consecuencia = -1 and Consecuencia is null) or @Consecuencia = 0)
							and ((@Estado > 0 and Estado = @Estado) or (@Estado = -1 and Estado is null) or @Estado = 0)
						) c
	

			IF @Sort = 'Seguimiento.Afiliado_Rut' and @Orden = 'asc'
			BEGIN
					select * from (
						select * , ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut asc) pos, @TotalReg as total_reg
						from (
							select a.id_Asign, 
														a.Periodo, 
														a.Afiliado_Rut, 
														a.Afiliado_Dv, 
														a.Nombre, 
														a.Apellido,
														a.Empresa_Rut,
														a.Empresa_Dv,
														a.Empresa, 
														a.Holding,
														a.Segmento,
														a.PensionadoFFAA,
														a.Ejec_Asignacion,
														a.PreAprobadoFinal,
														a.TipoAsignacion,
														a.Prioridad,
														a.TipoCampania,
														a.Cuadrante,
														a.OfertaTexto,
														a.TipoDerivacion,

														b.ges_bcam_uid,
														b.ges_fecha_accion,
														b.ges_fecha_compromete,
														b.ges_descripcion_gst,
														b.ges_estado_gst,
														b.ges_ejecutivo_rut,
														b.ges_oficina
							from dbo.TabMotor_Asignacion a with(index(idx_ListarByEjecutivo2))
							outer apply(
								select * , 
										CASE WHEN LEN(ges_estado_gst) = 10 THEN left(ges_estado_gst,2) ELSE left(ges_estado_gst,1) END CausaBasal,
										CASE WHEN LEN(ges_estado_gst) = 10 THEN substring(ges_estado_gst,3,4) ELSE substring(ges_estado_gst,2,4) END Consecuencia,
										CASE WHEN LEN(ges_estado_gst) = 10 THEN substring(ges_estado_gst,7,4) ELSE substring(ges_estado_gst,6,4) END Estado
								from dbo.TabMotor_Gestion xx	with(index(DX4))
								where ges_bcam_uid = a.id_Asign
								and ges_fecha_accion = (select max(ges_fecha_accion) 
																				from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) 
																				where xy.ges_bcam_uid = xx.ges_bcam_uid)
							) b
							where a.periodo=@Periodo
							and a.Ejec_Asignacion = @RutEjec and a.TipoAsignacion = 2
							and ((@Prioridad <> '' and Prioridad = @Prioridad) or (@Prioridad = ''))
							and ((@RutAfiliado <> '' and CONVERT(VARCHAR(20),Afiliado_Rut)+'-'+Afiliado_Dv = REPLACE(@RutAfiliado,'.','')) or (@RutAfiliado = ''))
							and ((@CausaBasal > 0 and CausaBasal = @CausaBasal) or (@CausaBasal = -1 and CausaBasal is null) or @CausaBasal = 0)
							and ((@Consecuencia > 0 and Consecuencia = @Consecuencia) or (@Consecuencia = -1 and Consecuencia is null) or @Consecuencia = 0)
							and ((@Estado > 0 and Estado = @Estado) or (@Estado = -1 and Estado is null) or @Estado = 0)
						) c
							
						) d
						where pos between @Offset+1 and @Offset + @Limit


			END
			ELSE IF @Sort = 'Seguimiento.Afiliado_Rut' and @Orden = 'desc'
			BEGIN
					select * from (
						select * , ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut desc) pos, @TotalReg as total_reg
						from (
							select a.id_Asign, 
														a.Periodo, 
														a.Afiliado_Rut, 
														a.Afiliado_Dv, 
														a.Nombre, 
														a.Apellido,
														a.Empresa_Rut,
														a.Empresa_Dv,
														a.Empresa, 
														a.Holding,
														a.Segmento,
														a.PensionadoFFAA,
														a.Ejec_Asignacion,
														a.PreAprobadoFinal,
														a.TipoAsignacion,
														a.Prioridad,
														a.TipoCampania,
														a.Cuadrante,
														a.OfertaTexto,
														a.TipoDerivacion,

														b.ges_bcam_uid,
														b.ges_fecha_accion,
														b.ges_fecha_compromete,
														b.ges_descripcion_gst,
														b.ges_estado_gst,
														b.ges_ejecutivo_rut,
														b.ges_oficina
							from dbo.TabMotor_Asignacion a with(index(idx_ListarByEjecutivo2))
							outer apply(
								select * , 
										CASE WHEN LEN(ges_estado_gst) = 10 THEN left(ges_estado_gst,2) ELSE left(ges_estado_gst,1) END CausaBasal,
										CASE WHEN LEN(ges_estado_gst) = 10 THEN substring(ges_estado_gst,3,4) ELSE substring(ges_estado_gst,2,4) END Consecuencia,
										CASE WHEN LEN(ges_estado_gst) = 10 THEN substring(ges_estado_gst,7,4) ELSE substring(ges_estado_gst,6,4) END Estado
								from dbo.TabMotor_Gestion xx	with(index(DX4))
								where ges_bcam_uid = a.id_Asign
								and ges_fecha_accion = (select max(ges_fecha_accion) 
																				from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) 
																				where xy.ges_bcam_uid = xx.ges_bcam_uid)
							) b
							where a.periodo=@Periodo
							and a.Ejec_Asignacion = @RutEjec and a.TipoAsignacion = 2
							and ((@Prioridad <> '' and Prioridad = @Prioridad) or (@Prioridad = ''))
							and ((@RutAfiliado <> '' and CONVERT(VARCHAR(20),Afiliado_Rut)+'-'+Afiliado_Dv = REPLACE(@RutAfiliado,'.','')) or (@RutAfiliado = ''))
							and ((@CausaBasal > 0 and CausaBasal = @CausaBasal) or (@CausaBasal = -1 and CausaBasal is null) or @CausaBasal = 0)
							and ((@Consecuencia > 0 and Consecuencia = @Consecuencia) or (@Consecuencia = -1 and Consecuencia is null) or @Consecuencia = 0)
							and ((@Estado > 0 and Estado = @Estado) or (@Estado = -1 and Estado is null) or @Estado = 0)
						) c
							
						) d
						where pos between @Offset+1 and @Offset + @Limit
			END

		END
	
	ELSE IF @TipoCamp = 4
	BEGIN
			/*TOTALES*/
			select @TotalReg = count(*)
			from (
							select a.id_Asign, 
														a.Periodo, 
														a.Afiliado_Rut, 
														a.Afiliado_Dv, 
														a.Nombre, 
														a.Apellido,
														a.Empresa_Rut,
														a.Empresa_Dv,
														a.Empresa, 
														a.Holding,
														a.Segmento,
														a.PensionadoFFAA,
														a.Ejec_Asignacion,
														a.PreAprobadoFinal,
														a.TipoAsignacion,
														a.Prioridad,
														a.TipoCampania,
														a.Cuadrante,
														a.OfertaTexto,
														a.TipoDerivacion,

														b.ges_bcam_uid,
														b.ges_fecha_accion,
														b.ges_fecha_compromete,
														b.ges_descripcion_gst,
														b.ges_estado_gst,
														b.ges_ejecutivo_rut,
														b.ges_oficina--,
														--ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut desc) pos
							from dbo.TabMotor_Asignacion a with(index(idx_ListarByEjecutivo2))
							outer apply(
								select * 
								from dbo.TabMotor_Gestion xx	with(index(DX4))
								where ges_bcam_uid = a.id_Asign
								and ges_fecha_accion = (select max(ges_fecha_accion) 
																				from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) 
																				where xy.ges_bcam_uid = xx.ges_bcam_uid)
							) b
							where a.periodo=@Periodo
							and a.Ejec_Asignacion = @RutEjec and a.TipoAsignacion = 4
							and ((@SubEstado > 0 and ges_estado_gst = @SubEstado) or (@SubEstado = -1 and ges_estado_gst is null) or @SubEstado = 0)
							and ((@Estado > 0 and LEFT(ges_estado_gst,1) = @Estado) or (@Estado = -1 and ges_estado_gst is null) or @Estado = 0)
							and ((@RutAfiliado <> '' and CONVERT(VARCHAR(20),Afiliado_Rut)+'-'+Afiliado_Dv = REPLACE(@RutAfiliado,'.','')) or (@RutAfiliado = ''))
							
						) c


			/*DATA*/
			/*ORDEN POR RUT ASC*/
			IF @Sort = 'Seguimiento.Afiliado_Rut' and @Orden = 'asc'
			BEGIN
				select * from (
						select * , ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut asc) pos, @TotalReg as total_reg

						from (
							select a.id_Asign, 
														a.Periodo, 
														a.Afiliado_Rut, 
														a.Afiliado_Dv, 
														a.Nombre, 
														a.Apellido,
														a.Empresa_Rut,
														a.Empresa_Dv,
														a.Empresa, 
														a.Holding,
														a.Segmento,
														a.PensionadoFFAA,
														a.Ejec_Asignacion,
														a.PreAprobadoFinal,
														a.TipoAsignacion,
														a.Prioridad,
														a.TipoCampania,
														a.Cuadrante,
														a.OfertaTexto,
														a.TipoDerivacion,

														b.ges_bcam_uid,
														b.ges_fecha_accion,
														b.ges_fecha_compromete,
														b.ges_descripcion_gst,
														b.ges_estado_gst,
														b.ges_ejecutivo_rut,
														b.ges_oficina
							from dbo.TabMotor_Asignacion a with(index(idx_ListarByEjecutivo2))
							outer apply(
								select * 
								from dbo.TabMotor_Gestion xx	with(index(DX4))
								where ges_bcam_uid = a.id_Asign
								and ges_fecha_accion = (select max(ges_fecha_accion) 
																				from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) 
																				where xy.ges_bcam_uid = xx.ges_bcam_uid)
							) b
							where a.periodo=@Periodo
							and a.Ejec_Asignacion = @RutEjec and a.TipoAsignacion = 4
							and ((@SubEstado > 0 and ges_estado_gst = @SubEstado) or (@SubEstado = -1 and ges_estado_gst is null) or @SubEstado = 0)
							and ((@Estado > 0 and LEFT(ges_estado_gst,1) = @Estado) or (@Estado = -1 and ges_estado_gst is null) or @Estado = 0)
							and ((@RutAfiliado <> '' and CONVERT(VARCHAR(20),Afiliado_Rut)+'-'+Afiliado_Dv = REPLACE(@RutAfiliado,'.','')) or (@RutAfiliado = ''))
						) c
						) d
						where pos between @Offset+1 and @Offset + @Limit
						
			END
			ELSE IF @Sort = 'Seguimiento.Afiliado_Rut' and @Orden = 'desc'
			BEGIN
				select * from (
						select * , ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut desc) pos, @TotalReg as total_reg

						from (
							select a.id_Asign, 
														a.Periodo, 
														a.Afiliado_Rut, 
														a.Afiliado_Dv, 
														a.Nombre, 
														a.Apellido,
														a.Empresa_Rut,
														a.Empresa_Dv,
														a.Empresa, 
														a.Holding,
														a.Segmento,
														a.PensionadoFFAA,
														a.Ejec_Asignacion,
														a.PreAprobadoFinal,
														a.TipoAsignacion,
														a.Prioridad,
														a.TipoCampania,
														a.Cuadrante,
														a.OfertaTexto,
														a.TipoDerivacion,

														b.ges_bcam_uid,
														b.ges_fecha_accion,
														b.ges_fecha_compromete,
														b.ges_descripcion_gst,
														b.ges_estado_gst,
														b.ges_ejecutivo_rut,
														b.ges_oficina
							from dbo.TabMotor_Asignacion a with(index(idx_ListarByEjecutivo2))
							outer apply(
								select * 
								from dbo.TabMotor_Gestion xx	with(index(DX4))
								where ges_bcam_uid = a.id_Asign
								and ges_fecha_accion = (select max(ges_fecha_accion) 
																				from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) 
																				where xy.ges_bcam_uid = xx.ges_bcam_uid)
							) b
							where a.periodo=@Periodo
							and a.Ejec_Asignacion = @RutEjec and a.TipoAsignacion = 4
							and ((@SubEstado > 0 and ges_estado_gst = @SubEstado) or (@SubEstado = -1 and ges_estado_gst is null) or @SubEstado = 0)
							and ((@Estado > 0 and LEFT(ges_estado_gst,1) = @Estado) or (@Estado = -1 and ges_estado_gst is null) or @Estado = 0)
							and ((@RutAfiliado <> '' and CONVERT(VARCHAR(20),Afiliado_Rut)+'-'+Afiliado_Dv = REPLACE(@RutAfiliado,'.','')) or (@RutAfiliado = ''))
						) c
						) d
						where pos between @Offset+1 and @Offset + @Limit
						
			END
		END
 
	ELSE IF @TipoCamp = 5
	BEGIN
		/*TOTALES*/
		select @TotalReg = count(*)
		from (
						select a.id_Asign, 
													a.Periodo, 
													a.Afiliado_Rut, 
													a.Afiliado_Dv, 
													a.Nombre, 
													a.Apellido,
													a.Empresa_Rut,
													a.Empresa_Dv,
													a.Empresa, 
													a.Holding,
													a.Segmento,
													a.PensionadoFFAA,
													a.Ejec_Asignacion,
													a.PreAprobadoFinal,
													a.TipoAsignacion,
													a.Prioridad,
													a.TipoCampania,
													a.Cuadrante,
													a.OfertaTexto,
													a.TipoDerivacion,

													b.ges_bcam_uid,
													b.ges_fecha_accion,
													b.ges_fecha_compromete,
													b.ges_descripcion_gst,
													b.ges_estado_gst,
													b.ges_ejecutivo_rut,
													b.ges_oficina--,
													--ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut desc) pos
						from dbo.TabMotor_Asignacion a with(index(idx_ListarByEjecutivo2))
						outer apply(
							select * 
							from dbo.TabMotor_Gestion xx	with(index(DX4))
							where ges_bcam_uid = a.id_Asign
							and ges_fecha_accion = (select max(ges_fecha_accion) 
																			from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) 
																			where xy.ges_bcam_uid = xx.ges_bcam_uid)
						) b
						where a.periodo=@Periodo
						and a.Oficina = @OficinaEjec and a.TipoAsignacion IN (1,5) and a.TipoDerivacion IN ('WEB','CALL')
						and ((@SubEstado > 0 and ges_estado_gst = @SubEstado) or (@SubEstado = -1 and ges_estado_gst is null) or @SubEstado = 0)
						and ((@Estado > 0 and (	(LEN(CONVERT(VARCHAR(5),@Estado)) = 1 and LEFT(ges_estado_gst,1) = @Estado) or 
												(LEN(CONVERT(VARCHAR(5),@Estado)) = 2 and LEFT(ges_estado_gst,2) = @Estado))) or (@Estado = -1 and ges_estado_gst is null) or @Estado = 0)
						and ((@Prioridad <> '' and Prioridad = @Prioridad) or (@Prioridad = ''))
						and ((@Segmento <> '' and UPPER(Segmento) = UPPER(@Segmento)) or (@Segmento = ''))
						and ((@Tipo <> '' and UPPER(TipoCampania) = UPPER(@Tipo)) or (@Tipo = ''))
						and ((@RutAfiliado <> '' and CONVERT(VARCHAR(20),Afiliado_Rut)+'-'+Afiliado_Dv = REPLACE(@RutAfiliado,'.','')) or (@RutAfiliado = ''))
						
					) c



			/*DATA*/
			/*ORDEN POR RUT ASC*/
			IF @Sort = 'Seguimiento.Afiliado_Rut' and @Orden = 'asc'
			BEGIN
				select * from (
						select * , ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut asc) pos, @TotalReg as total_reg

						from (
							select a.id_Asign, 
													a.Periodo, 
													a.Afiliado_Rut, 
													a.Afiliado_Dv, 
													a.Nombre, 
													a.Apellido,
													a.Empresa_Rut,
													a.Empresa_Dv,
													a.Empresa, 
													a.Holding,
													a.Segmento,
													a.PensionadoFFAA,
													a.Ejec_Asignacion,
													a.PreAprobadoFinal,
													a.TipoAsignacion,
													a.Prioridad,
													a.TipoCampania,
													a.Cuadrante,
													a.OfertaTexto,
													a.TipoDerivacion,

													b.ges_bcam_uid,
													b.ges_fecha_accion,
													b.ges_fecha_compromete,
													b.ges_descripcion_gst,
													b.ges_estado_gst,
													b.ges_ejecutivo_rut,
													b.ges_oficina--,
													--ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut desc) pos
						from dbo.TabMotor_Asignacion a with(index(idx_ListarByEjecutivo2))
						outer apply(
							select * 
							from dbo.TabMotor_Gestion xx	with(index(DX4))
							where ges_bcam_uid = a.id_Asign
							and ges_fecha_accion = (select max(ges_fecha_accion) 
																			from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) 
																			where xy.ges_bcam_uid = xx.ges_bcam_uid)
						) b
						where a.periodo=@Periodo
						and a.Oficina = @OficinaEjec and a.TipoAsignacion IN (1,5) and a.TipoDerivacion IN ('WEB','CALL')
						and ((@SubEstado > 0 and ges_estado_gst = @SubEstado) or (@SubEstado = -1 and ges_estado_gst is null) or @SubEstado = 0)
						and ((@Estado > 0 and (	(LEN(CONVERT(VARCHAR(5),@Estado)) = 1 and LEFT(ges_estado_gst,1) = @Estado) or 
												(LEN(CONVERT(VARCHAR(5),@Estado)) = 2 and LEFT(ges_estado_gst,2) = @Estado))) or (@Estado = -1 and ges_estado_gst is null) or @Estado = 0)
						and ((@Prioridad <> '' and Prioridad = @Prioridad) or (@Prioridad = ''))
						and ((@Segmento <> '' and UPPER(Segmento) = UPPER(@Segmento)) or (@Segmento = ''))
						and ((@Tipo <> '' and UPPER(TipoCampania) = UPPER(@Tipo)) or (@Tipo = ''))
						and ((@RutAfiliado <> '' and CONVERT(VARCHAR(20),Afiliado_Rut)+'-'+Afiliado_Dv = REPLACE(@RutAfiliado,'.','')) or (@RutAfiliado = ''))
						
						) c
						) d
						where pos between @Offset+1 and @Offset + @Limit
						
			END
			ELSE IF @Sort = 'Seguimiento.Afiliado_Rut' and @Orden = 'desc'
			BEGIN
				select * from (
						select * , ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut desc) pos, @TotalReg as total_reg

						from (
							select a.id_Asign, 
													a.Periodo, 
													a.Afiliado_Rut, 
													a.Afiliado_Dv, 
													a.Nombre, 
													a.Apellido,
													a.Empresa_Rut,
													a.Empresa_Dv,
													a.Empresa, 
													a.Holding,
													a.Segmento,
													a.PensionadoFFAA,
													a.Ejec_Asignacion,
													a.PreAprobadoFinal,
													a.TipoAsignacion,
													a.Prioridad,
													a.TipoCampania,
													a.Cuadrante,
													a.OfertaTexto,
													a.TipoDerivacion,

													b.ges_bcam_uid,
													b.ges_fecha_accion,
													b.ges_fecha_compromete,
													b.ges_descripcion_gst,
													b.ges_estado_gst,
													b.ges_ejecutivo_rut,
													b.ges_oficina--,
													--ROW_NUMBER() OVER (ORDER BY  Afiliado_Rut desc) pos
						from dbo.TabMotor_Asignacion a with(index(idx_ListarByEjecutivo2))
						outer apply(
							select * 
							from dbo.TabMotor_Gestion xx	with(index(DX4))
							where ges_bcam_uid = a.id_Asign
							and ges_fecha_accion = (select max(ges_fecha_accion) 
																			from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) 
																			where xy.ges_bcam_uid = xx.ges_bcam_uid)
						) b
						where a.periodo=@Periodo
						and a.Oficina = @OficinaEjec and a.TipoAsignacion IN (1,5) and a.TipoDerivacion IN ('WEB','CALL')
						and ((@SubEstado > 0 and ges_estado_gst = @SubEstado) or (@SubEstado = -1 and ges_estado_gst is null) or @SubEstado = 0)
						and ((@Estado > 0 and (	(LEN(CONVERT(VARCHAR(5),@Estado)) = 1 and LEFT(ges_estado_gst,1) = @Estado) or 
												(LEN(CONVERT(VARCHAR(5),@Estado)) = 2 and LEFT(ges_estado_gst,2) = @Estado))) or (@Estado = -1 and ges_estado_gst is null) or @Estado = 0)
						and ((@Prioridad <> '' and Prioridad = @Prioridad) or (@Prioridad = ''))
						and ((@Segmento <> '' and UPPER(Segmento) = UPPER(@Segmento)) or (@Segmento = ''))
						and ((@Tipo <> '' and UPPER(TipoCampania) = UPPER(@Tipo)) or (@Tipo = ''))
						and ((@RutAfiliado <> '' and CONVERT(VARCHAR(20),Afiliado_Rut)+'-'+Afiliado_Dv = REPLACE(@RutAfiliado,'.','')) or (@RutAfiliado = ''))
						
						) c
						) d
						where pos between @Offset+1 and @Offset + @Limit
						
			END
	END

END