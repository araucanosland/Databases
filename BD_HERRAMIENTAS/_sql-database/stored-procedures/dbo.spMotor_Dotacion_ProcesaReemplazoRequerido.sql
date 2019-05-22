IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Dotacion_ProcesaReemplazoRequerido]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Dotacion_ProcesaReemplazoRequerido]
GO
CREATE PROCEDURE [dbo].[spMotor_Dotacion_ProcesaReemplazoRequerido]
  @EjecutivoRut AS varchar(20),
	@Forzar as bit = 0
	
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'
	declare @existeAusencia int = 0
	declare @existeMarca int = 0
	declare @idAusencia int  = 0
	/*Logica*/
	
	/*1.- Obtener si el rut tiene licencia medica*/

	--select ejec_rut, aus_fecha_inicio, aus_fecha_fin, CONVERT(DATE,GETDATE()) today, tipo_ausencia_id, DATEDIFF(day, aus_fecha_inicio, aus_fecha_fin) Dias
	select @existeAusencia = count(*)
	from TabMotor_Ausencia
	where CONVERT(DATE,aus_fecha_inicio) <= CONVERT(DATE,GETDATE()) AND CONVERT(DATE, aus_fecha_fin) >= CONVERT(DATE,GETDATE())
	and tipo_ausencia_id in (3,4,5,6,7,8)
	and ejec_rut = @EjecutivoRut
	
	select @existeMarca = count(*) 
	from dbo.TabMotor_MarcaReemplazo where EjecutivoRut = @EjecutivoRut;


	IF @existeAusencia > 0 and @existeMarca = 0
	BEGIN
		
		SELECT @idAusencia = aus_id 
		FROM dbo.TabMotor_Ausencia
		WHERE ejec_rut = @EjecutivoRut
		AND tipo_ausencia_id in (3,4,5,6,7,8)
		AND CONVERT(DATE,aus_fecha_inicio) <= CONVERT(DATE,GETDATE()) AND CONVERT(DATE, aus_fecha_fin) >= CONVERT(DATE,GETDATE())

		/*update dbo.TabMotor_Ausencia
		set aus_marca_ausencia = abs(isnull(@existeMarca,0)-1)
		where aus_id = @idAusencia*/

		delete from dbo.TabMotor_MarcaReemplazo
		where EjecutivoRut = @EjecutivoRut
		
		insert into dbo.TabMotor_MarcaReemplazo (EjecutivoRut, AusenciaId, MarcaForzada, FechaMarca)
		values (@EjecutivoRut, @idAusencia, 0, GETDATE())


		
	END

	
	ELSE IF @existeAusencia = 0 AND @Forzar = 1 and @existeMarca = 0
	BEGIN
		delete from dbo.TabMotor_MarcaReemplazo
		where EjecutivoRut = @EjecutivoRut
		
		insert into dbo.TabMotor_MarcaReemplazo (EjecutivoRut, AusenciaId, MarcaForzada, FechaMarca)
		values (@EjecutivoRut, @idAusencia, 1, GETDATE())
	END

	ELSE IF @Forzar = 0 and @existeMarca > 0
	BEGIN
		delete from dbo.TabMotor_MarcaReemplazo
		where EjecutivoRut = @EjecutivoRut
		
	END
	ELSE 
	BEGIN
		RAISERROR('No hay alguna ausencia registrada para el ejecutivo',16,1); 
	END
	

END