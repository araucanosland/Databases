IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Asignacion_Guardar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Asignacion_Guardar]
GO
CREATE PROCEDURE [dbo].[spMotor_Asignacion_Guardar]
(
	@id_Asign int,
	@Periodo varchar(6),
	@Afiliado_Rut decimal(10,0),
	@Afiliado_Dv varchar(1),
	@Nombre text,
	@Apellido text,
	@Empresa_Rut varchar(255),
	@Empresa_Dv varchar(1),
	@Empresa varchar(255),
	@ClaRiesgoEmpresa varchar(20),
	@Holding varchar(25),
	@Celular varchar(15),
	@Telefono1 varchar(15),
	@Telefono2 varchar(15),
	@Email varchar(500),
	@MontoPension decimal(8,0),
	@MontoRenta int,
	@Monto_preaprobado int,
	@Antiguedad_en_Meses int,
	@LicMedicaVigente int,
	@CreditosVigentes int,
	@CredVig_Meses_Morosos int,
	@CredVig_MontoCuota int,
	@EsPensionado int,
	@EsPrivado int,
	@EsPublico int,
	@Contacto int,
	@Segmento varchar(11),
	@FechaNacimiento date,
	@Edad int,
	@PensionadoFFAA int,
	@EmpresaEsPensionado int,
	@EmpresaEsPublico int,
	@EmpresaEsPrivado int,
	@RiesgoPerfil varchar(10),
	@RiesgoMaxVecesRenta bigint,
	@RiesgoMaxPreAprobado bigint,
	@PreAprobadoFinal bigint,
	@CredVigente int,
	@Oficina int,
	@Asignado int,
	@Ejec_Asignacion varchar(15)
)
AS
-- =============================================
-- Autor                  : Carlos Pradenas
-- Fecha de Creacion      : 11-04-2017 17:46:40
-- Tabla Principal        : TabMotor_Asignacion
-- Descripcion            : Guarda un registro en la tabla TabMotor_Asignacion
-- =============================================
-- Modificado por         :
-- Fecha de Modificacion  :
-- Descripcion            :
-- =============================================
BEGIN

	SET NOCOUNT ON;

	DECLARE @identity int

	SET @identity = @id_Asign

	IF @identity > 0
	BEGIN
		UPDATE TabMotor_Asignacion SET 
			id_Asign = @id_Asign,
			Periodo = @Periodo,
			Afiliado_Rut = @Afiliado_Rut,
			Afiliado_Dv = @Afiliado_Dv,
			Nombre = @Nombre,
			Apellido = @Apellido,
			Empresa_Rut = @Empresa_Rut,
			Empresa_Dv = @Empresa_Dv,
			Empresa = @Empresa,
			ClaRiesgoEmpresa = @ClaRiesgoEmpresa,
			Holding = @Holding,
			Celular = @Celular,
			Telefono1 = @Telefono1,
			Telefono2 = @Telefono2,
			Email = @Email,
			MontoPension = @MontoPension,
			MontoRenta = @MontoRenta,
			Monto_preaprobado = @Monto_preaprobado,
			Antiguedad_en_Meses = @Antiguedad_en_Meses,
			LicMedicaVigente = @LicMedicaVigente,
			CreditosVigentes = @CreditosVigentes,
			CredVig_Meses_Morosos = @CredVig_Meses_Morosos,
			CredVig_MontoCuota = @CredVig_MontoCuota,
			EsPensionado = @EsPensionado,
			EsPrivado = @EsPrivado,
			EsPublico = @EsPublico,
			Contacto = @Contacto,
			Segmento = @Segmento,
			FechaNacimiento = @FechaNacimiento,
			Edad = @Edad,
			PensionadoFFAA = @PensionadoFFAA,
			EmpresaEsPensionado = @EmpresaEsPensionado,
			EmpresaEsPublico = @EmpresaEsPublico,
			EmpresaEsPrivado = @EmpresaEsPrivado,
			RiesgoPerfil = @RiesgoPerfil,
			RiesgoMaxVecesRenta = @RiesgoMaxVecesRenta,
			RiesgoMaxPreAprobado = @RiesgoMaxPreAprobado,
			PreAprobadoFinal = @PreAprobadoFinal,
			CredVigente = @CredVigente,
			Oficina = @Oficina,
			Asignado = @Asignado,
			Ejec_Asignacion = @Ejec_Asignacion
		WHERE id_Asign = @identity
	END
	ELSE
	BEGIN
		INSERT INTO TabMotor_Asignacion
		(
			id_Asign,
			Periodo,
			Afiliado_Rut,
			Afiliado_Dv,
			Nombre,
			Apellido,
			Empresa_Rut,
			Empresa_Dv,
			Empresa,
			ClaRiesgoEmpresa,
			Holding,
			Celular,
			Telefono1,
			Telefono2,
			Email,
			MontoPension,
			MontoRenta,
			Monto_preaprobado,
			Antiguedad_en_Meses,
			LicMedicaVigente,
			CreditosVigentes,
			CredVig_Meses_Morosos,
			CredVig_MontoCuota,
			EsPensionado,
			EsPrivado,
			EsPublico,
			Contacto,
			Segmento,
			FechaNacimiento,
			Edad,
			PensionadoFFAA,
			EmpresaEsPensionado,
			EmpresaEsPublico,
			EmpresaEsPrivado,
			RiesgoPerfil,
			RiesgoMaxVecesRenta,
			RiesgoMaxPreAprobado,
			PreAprobadoFinal,
			CredVigente,
			Oficina,
			Asignado,
			Ejec_Asignacion
		)
		VALUES
		(
			@id_Asign,
			@Periodo,
			@Afiliado_Rut,
			@Afiliado_Dv,
			@Nombre,
			@Apellido,
			@Empresa_Rut,
			@Empresa_Dv,
			@Empresa,
			@ClaRiesgoEmpresa,
			@Holding,
			@Celular,
			@Telefono1,
			@Telefono2,
			@Email,
			@MontoPension,
			@MontoRenta,
			@Monto_preaprobado,
			@Antiguedad_en_Meses,
			@LicMedicaVigente,
			@CreditosVigentes,
			@CredVig_Meses_Morosos,
			@CredVig_MontoCuota,
			@EsPensionado,
			@EsPrivado,
			@EsPublico,
			@Contacto,
			@Segmento,
			@FechaNacimiento,
			@Edad,
			@PensionadoFFAA,
			@EmpresaEsPensionado,
			@EmpresaEsPublico,
			@EmpresaEsPrivado,
			@RiesgoPerfil,
			@RiesgoMaxVecesRenta,
			@RiesgoMaxPreAprobado,
			@PreAprobadoFinal,
			@CredVigente,
			@Oficina,
			@Asignado,
			@Ejec_Asignacion
		)

		SELECT @identity = SCOPE_IDENTITY()
	END

	SELECT @identity
END