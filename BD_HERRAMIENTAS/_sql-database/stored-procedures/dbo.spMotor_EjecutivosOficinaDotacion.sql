IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_EjecutivosOficinaDotacion]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_EjecutivosOficinaDotacion]
GO



--[dbo].[spMotor_EjecutivosOficinaDotacion] '5bb11f38-0dc4-425e-9a93-fa3d7d8b72a2', 201806
CREATE PROCEDURE [dbo].[spMotor_EjecutivosOficinaDotacion]
(
	@Token varchar(50)
)
AS

BEGIN

	SET NOCOUNT ON;
	DECLARE @Periodo INT = (select MAX(Periodo) from BD_Herramientas..TabMotor_Asignacion)
	DECLARE @COD_OFI INT
	DECLARE @RUT_EJEC VARCHAR(50) = security.fnSca_ObtenerRutByToken(@Token)
	DECLARE @PeriodoActual INT = dbo.fnMotor_ObtenerPeriodoActual()
	DECLARE @PeriodoConsultado INT

		IF @Periodo > @PeriodoActual
		BEGIN
			SET @PeriodoConsultado = @Periodo
			SET @Periodo = @PeriodoActual;
		END
		SELECT @COD_OFI = Cod_Sucursal
		FROM TabMotor_Dotacion 
		where Rut = @RUT_EJEC
		and Periodo = @Periodo


		--Los Despedidos

		IF @PeriodoConsultado > @PeriodoActual
		BEGIN 
			/*SELECT Rut, Nombre, Cargo
			FROM TabMotor_Dotacion 
			where Cod_Sucursal=@COD_OFI
			and Periodo = @Periodo
			and Rut not in (
				select a.ejec_rut 
				from TabMotor_Ausencia a
				inner join TabMotor_TipoAusencia b on a.tipo_ausencia_id = b.taus_id
				inner join TabMotor_Dotacion c on a.ejec_rut = c.Rut
				and Periodo = @Periodo
				and b.taus_es_rango_fechas = 0
				and c.Cod_Sucursal = @COD_OFI
			)
			order by Nombre*/


			select a.Cargo, b.Rut, b.Nombre, c.Rut RutReemplazo, c.Nombre NombreReemplazo, (
					select count(*) N
					from TabMotor_Ausencia 
					where convert(date, getdate()) between convert(date, aus_fecha_inicio) and convert(date, aus_fecha_fin)
					and ejec_rut = a.Titular
			) TitularAusente
			from dbo.TabMotor_DotacionAutorizada a
			left join dbo.TabMotor_Dotacion b on b.Rut = a.Titular and a.Oficina = b.Cod_Sucursal and b.Periodo = @Periodo
			left join (
				SELECT *
				FROM dbo.TabMotor_Dotacion 
				WHERE Cod_Sucursal = @COD_OFI
				AND Periodo = @Periodo
				AND Rut NOT IN (select a.Titular
				from dbo.TabMotor_DotacionAutorizada a
				left join dbo.TabMotor_Dotacion b on b.Rut = a.Titular and a.Oficina = b.Cod_Sucursal and b.Periodo = @Periodo
				where a.Oficina = @COD_OFI)

			) c on c.Rut = a.Reemplazo and a.Oficina = c.Cod_Sucursal and c.Periodo = @Periodo

			where a.Oficina = @COD_OFI

			and (a.Titular not in (
					select a.ejec_rut 
					from TabMotor_Ausencia a
					inner join TabMotor_TipoAusencia b on a.tipo_ausencia_id = b.taus_id
					inner join TabMotor_Dotacion c on a.ejec_rut = c.Rut
					and Periodo = @Periodo
					and b.taus_es_rango_fechas = 0
					and c.Cod_Sucursal = @COD_OFI
				)
			or 
				a.Reemplazo not in (
					select a.ejec_rut 
					from TabMotor_Ausencia a
					inner join TabMotor_TipoAusencia b on a.tipo_ausencia_id = b.taus_id
					inner join TabMotor_Dotacion c on a.ejec_rut = c.Rut
					and Periodo = @Periodo
					and b.taus_es_rango_fechas = 0
					and c.Cod_Sucursal = @COD_OFI
				)
			)


			order by a.Cargo


		END 
		ELSE 
		BEGIN 
			/*SELECT Rut, Nombre, Cargo
			FROM TabMotor_Dotacion 
			where Cod_Sucursal=@COD_OFI
			and Periodo = @Periodo
			order by Nombre*/

			select a.Cargo, b.Rut, b.Nombre, c.Rut RutReemplazo, c.Nombre NombreReemplazo, (
					select count(*) N
					from TabMotor_Ausencia 
					where convert(date, getdate()) between convert(date, aus_fecha_inicio) and convert(date, aus_fecha_fin)
					and ejec_rut = a.Titular
			) TitularAusente
			from dbo.TabMotor_DotacionAutorizada a
			left join dbo.TabMotor_Dotacion b on b.Rut = a.Titular and a.Oficina = b.Cod_Sucursal and b.Periodo = @Periodo
			left join (
				SELECT *
				FROM dbo.TabMotor_Dotacion 
				WHERE Cod_Sucursal = @COD_OFI
				AND Periodo = @Periodo
				AND Rut NOT IN (select a.Titular
				from dbo.TabMotor_DotacionAutorizada a
				left join dbo.TabMotor_Dotacion b on b.Rut = a.Titular and a.Oficina = b.Cod_Sucursal and b.Periodo = @Periodo
				where a.Oficina = @COD_OFI)

			) c on c.Rut = a.Reemplazo and a.Oficina = c.Cod_Sucursal and c.Periodo = @Periodo

			where a.Oficina = @COD_OFI
			order by a.Cargo


		END


END