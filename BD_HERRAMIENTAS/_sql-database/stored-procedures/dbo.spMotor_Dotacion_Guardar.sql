IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Dotacion_Guardar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Dotacion_Guardar]
GO
CREATE PROCEDURE [dbo].[spMotor_Dotacion_Guardar]
(
@Rut VARCHAR(30),
@Nombres VARCHAR(255),
@IdSucursal INT,
@Cargo VARCHAR(255),
@EsAsignable INT,
@TipoContrato VARCHAR(2),
@FechaIngreso DATETIME,
@FechaFinaliza DATETIME,
@Email VARCHAR(255),
@Sexo VARCHAR(1)
)
AS
BEGIN
DECLARE @NombreSucursal VARCHAR(255);
DECLARE @Periodo INT = dbo.fnMotor_ObtenerPeriodoActual()
DECLARE @ExisteEjec INT;


select @NombreSucursal = Sucursal 
from TabMotor_Dotacion
where Cod_Sucursal = @IdSucursal
group by Sucursal 

select @ExisteEjec = count(*) 
from TabMotor_Dotacion
where Periodo = @Periodo
and Rut = @Rut

IF @ExisteEjec > 0
	BEGIN
			RAISERROR ('Ejecutivo ya existe en base de datos',16,1);
	END
	ELSE
	BEGIN
		--select * from TabMotor_Dotacion 
		INSERT INTO TabMotor_Dotacion 
		VALUES (
				@Periodo,
				@Rut,
				LEFT(@Rut,8),
				RIGHT(@Rut,1),
				@Nombres,
				@IdSucursal,
				@NombreSucursal,
				@Cargo,
				@Email,
				'', --TELEFONO
				0,  --ANEXO
				'', --TIPO AUSENCIA
				'', --Ausencia_FechaIni
				'', --Ausencia_FechaFin
				0,  --HabilesMes
				0,  --DiasAusentes
				0,  --DiasLaborables
				0,  --NReg_Asignacion
				1,  --TipoAsignacion
				'Comercial', --AsignacionObs
				@EsAsignable,
				'', --Canal
				CONVERT(DATE,@FechaIngreso),  --FechaIngreso
				CONVERT(DATE,@FechaFinaliza), --FechaFinaliza
				@TipoContrato,
				@Cargo,
				@Sexo
		)


		INSERT INTO security.TabSca_Usuario (usr_nombre, usr_clave, usr_rut, usr_noticia_inicio)
		VALUES	(@Nombres, @Rut, @Rut, 0)
	END
END