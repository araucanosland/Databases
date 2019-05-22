IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Asignacion_ListarByEjecutivoPag2]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Asignacion_ListarByEjecutivoPag2]
GO
CREATE PROCEDURE [dbo].[spMotor_Asignacion_ListarByEjecutivoPag2]
	@Periodo int ,
	@TipoCamp int,
	@Estado int=0,
	@SubEstado int = 0,
	@CausaBasal int = 0,
	@Consecuencia int = 0,
	@Prioridad varchar(20) = '',
	@Segmento varchar(50) = '',
	@Tipo varchar(100) = '',
	@Vencimiento varchar(50) = '',
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
	declare @Query NVARCHAR(MAX) = ''

	IF @Sort = 'IdBaseCampagna'
	BEGIN
		SET @Sort = 'ges_fecha_compromete'
	END

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
							and ((@Vencimiento<> '' and ((@Vencimiento = 'PROX5DIAS' and CONVERT(DATE,ges_fecha_compromete) between CONVERT(DATE,DATEADD(DAY,1,GETDATE())) and CONVERT(DATE,DATEADD(DAY,6,GETDATE()))) or (@Vencimiento = 'HOY' and CONVERT(DATE,ges_fecha_compromete) = CONVERT(DATE,GETDATE())) or (@Vencimiento = 'AYER' and CONVERT(DATE,ges_fecha_compromete) not in ('1753-01-01') and CONVERT(DATE,ges_fecha_compromete) < CONVERT(DATE,GETDATE())))) or (@Vencimiento=''))
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
							and ((@Vencimiento<> '' and ((@Vencimiento = 'PROX5DIAS' and CONVERT(DATE,ges_fecha_compromete) between CONVERT(DATE,DATEADD(DAY,1,GETDATE())) and CONVERT(DATE,DATEADD(DAY,6,GETDATE()))) or (@Vencimiento = 'HOY' and CONVERT(DATE,ges_fecha_compromete) = CONVERT(DATE,GETDATE())) or (@Vencimiento = 'AYER' and CONVERT(DATE,ges_fecha_compromete) not in ('1753-01-01') and CONVERT(DATE,ges_fecha_compromete) < CONVERT(DATE,GETDATE())))) or (@Vencimiento=''))
						) c
			
							
			SET @Query = '
				select * from (
						select * , ROW_NUMBER() OVER (ORDER BY '+@Sort+' '+@Orden+') pos, @TotalReg_ as total_reg

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
							where a.periodo=@Periodo_
							and a.Ejec_Asignacion = @RutEjec_ and a.TipoAsignacion = 1
							and ((@SubEstado_ > 0 and ges_estado_gst = @SubEstado_) or (@SubEstado_ = -1 and ges_estado_gst is null) or @SubEstado_ = 0)
							and ((@Estado_ > 0 and LEFT(ges_estado_gst,1) = @Estado_) or (@Estado_ = -1 and ges_estado_gst is null) or @Estado_ = 0)
							and ((@Prioridad_ <> '''' and Prioridad = @Prioridad_) or (@Prioridad_ = ''''))
							and ((@Segmento_ <> '''' and UPPER(Segmento) = UPPER(@Segmento_)) or (@Segmento_ = ''''))
							and ((@Tipo_ <> '''' and UPPER(TipoCampania) = UPPER(@Tipo_)) or (@Tipo_ = ''''))
							and ((@RutAfiliado_ <> '''' and CONVERT(VARCHAR(20),Afiliado_Rut)+''-''+Afiliado_Dv = REPLACE(@RutAfiliado_,''.'','''')) or (@RutAfiliado_ = ''''))
							and ((@Vencimiento_<> '''' and ((@Vencimiento_ = ''PROX5DIAS'' and CONVERT(DATE,ges_fecha_compromete) between CONVERT(DATE,DATEADD(DAY,1,GETDATE())) and CONVERT(DATE,DATEADD(DAY,6,GETDATE()))) or (@Vencimiento_ = ''HOY'' and CONVERT(DATE,ges_fecha_compromete) = CONVERT(DATE,GETDATE())) or (@Vencimiento_ = ''AYER'' and CONVERT(DATE,ges_fecha_compromete) not in (''1753-01-01'') and CONVERT(DATE,ges_fecha_compromete) < CONVERT(DATE,GETDATE())))) or (@Vencimiento_=''''))
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
														b.ges_oficina
							from dbo.TabMotor_Asignacion a with(index(idx_guardaGestion))
							outer apply(
								select * 
								from dbo.TabMotor_Gestion xx	with(index(DX4))
								where ges_bcam_uid = a.id_Asign
								and ges_fecha_accion = (select max(ges_fecha_accion) 
																				from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) 
																				where xy.ges_bcam_uid = xx.ges_bcam_uid)
							) b
							where a.periodo=@Periodo_
							and a.id_Asign in (select zz.ges_bcam_uid from dbo.TabMotor_Gestion zz with(index(IDX_RUT)) where zz.ges_ejecutivo_rut = @RutEjec_) and a.TipoAsignacion in (1,5) and a.Ejec_Asignacion <> @RutEjec_
							and ((@SubEstado_ > 0 and ges_estado_gst = @SubEstado_) or (@SubEstado_ = -1 and ges_estado_gst is null) or @SubEstado_ = 0)
							and ((@Estado_ > 0 and LEFT(ges_estado_gst,1) = @Estado_) or (@Estado_ = -1 and ges_estado_gst is null) or @Estado_ = 0)
							and ((@Prioridad_ <> '''' and Prioridad = @Prioridad_) or (@Prioridad_ = ''''))
							and ((@Segmento_ <> '''' and UPPER(Segmento) = UPPER(@Segmento_)) or (@Segmento_ = ''''))
							and ((@Tipo_ <> '''' and UPPER(TipoCampania) = UPPER(@Tipo_)) or (@Tipo_ = ''''))
							and ((@RutAfiliado_ <> '''' and CONVERT(VARCHAR(20),Afiliado_Rut)+''-''+Afiliado_Dv = REPLACE(@RutAfiliado_,''.'','''')) or (@RutAfiliado_ = ''''))
							and ((@Vencimiento_<> '''' and ((@Vencimiento_ = ''PROX5DIAS'' and CONVERT(DATE,ges_fecha_compromete) between CONVERT(DATE,DATEADD(DAY,1,GETDATE())) and CONVERT(DATE,DATEADD(DAY,6,GETDATE()))) or (@Vencimiento_ = ''HOY'' and CONVERT(DATE,ges_fecha_compromete) = CONVERT(DATE,GETDATE())) or (@Vencimiento_ = ''AYER'' and CONVERT(DATE,ges_fecha_compromete) not in (''1753-01-01'') and CONVERT(DATE,ges_fecha_compromete) < CONVERT(DATE,GETDATE())))) or (@Vencimiento_=''''))
						) c
						) d
						where pos between @Offset_+1 and @Offset_ + @Limit_'

			
			EXECUTE sp_executesql	@Query, 
									N'@RutEjec_ varchar(20), @Periodo_ int, @SubEstado_ int, @Estado_ int, @Prioridad_ varchar(20), @Segmento_ varchar(20), @Tipo_ varchar(20), @RutAfiliado_ varchar(20), @TotalReg_ int, @Offset_ int, @Limit_ int, @Vencimiento_ varchar(50)',
									@RutEjec_ =  @RutEjec, @Periodo_ = @Periodo, @SubEstado_= @SubEstado, @Estado_ = @Estado, @Prioridad_ = @Prioridad, @Segmento_ = @Segmento, @Tipo_ = @Tipo, @RutAfiliado_ = @RutAfiliado, @TotalReg_ = @TotalReg, @Offset_ = @Offset, @Limit_ = @Limit, @Vencimiento_ = @Vencimiento
			
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
							and ((@Vencimiento<> '' and ((@Vencimiento = 'PROX5DIAS' and CONVERT(DATE,ges_fecha_compromete) between CONVERT(DATE,DATEADD(DAY,1,GETDATE())) and CONVERT(DATE,DATEADD(DAY,6,GETDATE()))) or (@Vencimiento = 'HOY' and CONVERT(DATE,ges_fecha_compromete) = CONVERT(DATE,GETDATE())) or (@Vencimiento = 'AYER' and CONVERT(DATE,ges_fecha_compromete) not in ('1753-01-01') and CONVERT(DATE,ges_fecha_compromete) < CONVERT(DATE,GETDATE())))) or (@Vencimiento=''))
						) c
	
			

			SET @Query = '
				select * from (
						select * , ROW_NUMBER() OVER (ORDER BY '+@Sort+' '+@Orden+') pos, @TotalReg_ as total_reg
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
							where a.periodo=@Periodo_
							and a.Ejec_Asignacion = @RutEjec_ and a.TipoAsignacion = 2
							and ((@Prioridad_ <> '''' and Prioridad = @Prioridad_) or (@Prioridad_ = ''''))
							and ((@RutAfiliado_ <> '''' and CONVERT(VARCHAR(20),Afiliado_Rut)+''-''+Afiliado_Dv = REPLACE(@RutAfiliado_,''.'','''')) or (@RutAfiliado_ = ''''))
							and ((@CausaBasal_ > 0 and CausaBasal = @CausaBasal_) or (@CausaBasal_ = -1 and CausaBasal is null) or @CausaBasal_ = 0)
							and ((@Consecuencia_ > 0 and Consecuencia = @Consecuencia_) or (@Consecuencia_ = -1 and Consecuencia is null) or @Consecuencia_ = 0)
							and ((@Estado_ > 0 and Estado = @Estado_) or (@Estado_ = -1 and Estado is null) or @Estado_ = 0)
							and ((@Vencimiento_<> '''' and ((@Vencimiento_ = ''PROX5DIAS'' and CONVERT(DATE,ges_fecha_compromete) between CONVERT(DATE,DATEADD(DAY,1,GETDATE())) and CONVERT(DATE,DATEADD(DAY,6,GETDATE()))) or (@Vencimiento_ = ''HOY'' and CONVERT(DATE,ges_fecha_compromete) = CONVERT(DATE,GETDATE())) or (@Vencimiento_ = ''AYER'' and CONVERT(DATE,ges_fecha_compromete) not in (''1753-01-01'') and CONVERT(DATE,ges_fecha_compromete) < CONVERT(DATE,GETDATE())))) or (@Vencimiento_=''''))
						) c
							
						) d
						where pos between @Offset_ + 1 and @Offset_ + @Limit_'

			EXECUTE sp_executesql	@Query, 
									N'@RutEjec_ varchar(20), @Periodo_ int, @CausaBasal_ int, @Consecuencia_ int,  @Estado_ int, @Prioridad_ varchar(20), @RutAfiliado_ varchar(20), @TotalReg_ int, @Offset_ int, @Limit_ int, @Vencimiento_ varchar(50)',
									@RutEjec_ =  @RutEjec, @Periodo_ = @Periodo, @CausaBasal_ = @CausaBasal, @Consecuencia_= @Consecuencia, @Estado_ = @Estado, @Prioridad_ = @Prioridad, @RutAfiliado_ = @RutAfiliado, @TotalReg_ = @TotalReg, @Offset_ = @Offset, @Limit_ = @Limit, @Vencimiento_ = @Vencimiento

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
							and ((@Vencimiento<> '' and ((@Vencimiento = 'PROX5DIAS' and CONVERT(DATE,ges_fecha_compromete) between CONVERT(DATE,DATEADD(DAY,1,GETDATE())) and CONVERT(DATE,DATEADD(DAY,6,GETDATE()))) or (@Vencimiento = 'HOY' and CONVERT(DATE,ges_fecha_compromete) = CONVERT(DATE,GETDATE())) or (@Vencimiento = 'AYER' and CONVERT(DATE,ges_fecha_compromete) not in ('1753-01-01') and CONVERT(DATE,ges_fecha_compromete) < CONVERT(DATE,GETDATE())))) or (@Vencimiento=''))
						) c




			SET @Query = '
				select * from (
						select * , ROW_NUMBER() OVER (ORDER BY '+@Sort+' '+@Orden+') pos, @TotalReg_ as total_reg

						from (
							select	a.id_Asign, 
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
							where a.periodo=@Periodo_
							and a.Ejec_Asignacion = @RutEjec_ and a.TipoAsignacion = 4
							and ((@SubEstado_ > 0 and ges_estado_gst = @SubEstado_) or (@SubEstado_ = -1 and ges_estado_gst is null) or @SubEstado_ = 0)
							and ((@Estado_ > 0 and LEFT(ges_estado_gst,1) = @Estado_) or (@Estado_ = -1 and ges_estado_gst is null) or @Estado_ = 0)
							and ((@RutAfiliado_ <> '''' and CONVERT(VARCHAR(20),Afiliado_Rut)+''-''+Afiliado_Dv = REPLACE(@RutAfiliado_,''.'','''')) or (@RutAfiliado_ = ''''))
							and ((@Vencimiento_<> '''' and ((@Vencimiento_ = ''PROX5DIAS'' and CONVERT(DATE,ges_fecha_compromete) between CONVERT(DATE,DATEADD(DAY,1,GETDATE())) and CONVERT(DATE,DATEADD(DAY,6,GETDATE()))) or (@Vencimiento_ = ''HOY'' and CONVERT(DATE,ges_fecha_compromete) = CONVERT(DATE,GETDATE())) or (@Vencimiento_ = ''AYER'' and CONVERT(DATE,ges_fecha_compromete) not in (''1753-01-01'') and CONVERT(DATE,ges_fecha_compromete) < CONVERT(DATE,GETDATE())))) or (@Vencimiento_=''''))
						) c
						) d
						where pos between @Offset_ + 1 and @Offset_ + @Limit_';


						EXECUTE sp_executesql	@Query, 
									N'@RutEjec_ varchar(20), @Periodo_ int, @SubEstado_ int, @Estado_ int, @RutAfiliado_ varchar(20), @TotalReg_ int, @Offset_ int, @Limit_ int, @Vencimiento_ varchar(50)',
									@RutEjec_ =  @RutEjec, @Periodo_ = @Periodo, @SubEstado_= @SubEstado, @Estado_ = @Estado, @RutAfiliado_ = @RutAfiliado, @TotalReg_ = @TotalReg, @Offset_ = @Offset, @Limit_ = @Limit, @Vencimiento_ = @Vencimiento



			
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
						and ((@Vencimiento<> '' and ((@Vencimiento = 'PROX5DIAS' and CONVERT(DATE,ges_fecha_compromete) between CONVERT(DATE,DATEADD(DAY,1,GETDATE())) and CONVERT(DATE,DATEADD(DAY,6,GETDATE()))) or (@Vencimiento = 'HOY' and CONVERT(DATE,ges_fecha_compromete) = CONVERT(DATE,GETDATE())) or (@Vencimiento = 'AYER' and CONVERT(DATE,ges_fecha_compromete) not in ('1753-01-01') and CONVERT(DATE,ges_fecha_compromete) < CONVERT(DATE,GETDATE())))) or (@Vencimiento=''))
					) c

			
			SET @Query = '
				select * from (
						select * , ROW_NUMBER() OVER (ORDER BY  '+@Sort+' '+@Orden+') pos, @TotalReg_ as total_reg

						from (
							select	a.id_Asign, 
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
						where a.periodo=@Periodo_
						and a.Oficina = @OficinaEjec_ and a.TipoAsignacion IN (1,5) and a.TipoDerivacion IN (''WEB'',''CALL'')
						and ((@SubEstado_ > 0 and ges_estado_gst = @SubEstado_) or (@SubEstado_ = -1 and ges_estado_gst is null) or @SubEstado_ = 0)
						and ((@Estado_ > 0 and ((LEN(CONVERT(VARCHAR(5),@Estado_)) = 1 and LEFT(ges_estado_gst,1) = @Estado_) or 
												(LEN(CONVERT(VARCHAR(5),@Estado_)) = 2 and LEFT(ges_estado_gst,2) = @Estado_))) or (@Estado_ = -1 and ges_estado_gst is null) or @Estado_ = 0)
						and ((@Prioridad_ <> '''' and Prioridad = @Prioridad_) or (@Prioridad_ = ''''))
						and ((@Segmento_ <> '''' and UPPER(Segmento) = UPPER(@Segmento_)) or (@Segmento_ = ''''))
						and ((@Tipo_ <> '''' and UPPER(TipoCampania) = UPPER(@Tipo_)) or (@Tipo_ = ''''))
						and ((@RutAfiliado_ <> '''' and CONVERT(VARCHAR(20),Afiliado_Rut)+''-''+Afiliado_Dv = REPLACE(@RutAfiliado_,''.'','''')) or (@RutAfiliado_ = ''''))
						and ((@Vencimiento_<> '''' and ((@Vencimiento_ = ''PROX5DIAS'' and CONVERT(DATE,ges_fecha_compromete) between CONVERT(DATE,DATEADD(DAY,1,GETDATE())) and CONVERT(DATE,DATEADD(DAY,6,GETDATE()))) or (@Vencimiento_ = ''HOY'' and CONVERT(DATE,ges_fecha_compromete) = CONVERT(DATE,GETDATE())) or (@Vencimiento_ = ''AYER'' and CONVERT(DATE,ges_fecha_compromete) not in (''1753-01-01'') and CONVERT(DATE,ges_fecha_compromete) < CONVERT(DATE,GETDATE())))) or (@Vencimiento_=''''))
						) c
						) d
						where pos between @Offset_ + 1 and @Offset_ + @Limit_'

						EXECUTE sp_executesql	@Query, 
									N'@OficinaEjec_ int, @Periodo_ int, @SubEstado_ int, @Estado_ int, @Prioridad_ varchar(20), @Segmento_ varchar(20), @Tipo_ varchar(20), @RutAfiliado_ varchar(20), @TotalReg_ int, @Offset_ int, @Limit_ int, @Vencimiento_ varchar(50)',
									@OficinaEjec_ =  @OficinaEjec, @Periodo_ = @Periodo, @SubEstado_= @SubEstado, @Estado_ = @Estado, @Prioridad_ = @Prioridad, @Segmento_ = @Segmento, @Tipo_ = @Tipo, @RutAfiliado_ = @RutAfiliado, @TotalReg_ = @TotalReg, @Offset_ = @Offset, @Limit_ = @Limit, @Vencimiento_ = @Vencimiento

			
	END

END