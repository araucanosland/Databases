IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ObtenerEjecutivosOficinaByTokenProyeccionAdmin]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ObtenerEjecutivosOficinaByTokenProyeccionAdmin]
GO
CREATE PROCEDURE [dbo].[spMotor_ObtenerEjecutivosOficinaByTokenProyeccionAdmin]
(
	
	@Periodo INT,
	@CodSucursal INT

)
AS
-- =============================================
-- Autor                  : Charly Pradenas
-- Fecha de Creacion      : 12-04-2017 17:59:27
-- Tabla Principal        : TabMotor_Gestion
-- Descripcion            : Guarda un registro en la tabla TabMotor_Gestion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @COD_OFI INT
	--DECLARE @RUT_EJEC VARCHAR(50) = security.fnSca_ObtenerRutByToken(@Token)
	DECLARE @PeriodoActual INT = dbo.fnMotor_ObtenerPeriodoActual()
	DECLARE @PeriodoConsultado INT

		IF @Periodo > @PeriodoActual
		BEGIN
			SET @PeriodoConsultado = @Periodo
			SET @Periodo = @PeriodoActual;
		END


		--SELECT @CodSucursal = Cod_Sucursal
		--FROM TabMotor_Dotacion 
		--where Rut = @RUT_EJEC
		--and Periodo = @Periodo


		--Los Despedidos
		

		
		IF @PeriodoConsultado > @PeriodoActual
		BEGIN 
			SELECT *
			FROM TabMotor_Dotacion 
			where Cod_Sucursal=@CodSucursal
			and Periodo = @Periodo
			and Rut not in (
				select a.ejec_rut 
				from TabMotor_Ausencia a
				inner join TabMotor_TipoAusencia b on a.tipo_ausencia_id = b.taus_id
				inner join TabMotor_Dotacion c on a.ejec_rut = c.Rut
				and Periodo = @Periodo
				and b.taus_es_rango_fechas = 0
				and c.Cod_Sucursal = @CodSucursal
				and upper(c.Rut) not like '%I%'
			)
			order by Nombre
		END 
		ELSE 
		BEGIN 
			SELECT *
			FROM TabMotor_Dotacion 
			where Cod_Sucursal=@CodSucursal
			and Periodo = @Periodo
			and upper(Rut) not like '%I%'
			order by Nombre
		END


END