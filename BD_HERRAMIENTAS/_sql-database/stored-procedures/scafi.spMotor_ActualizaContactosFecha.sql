IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[scafi].[spMotor_ActualizaContactosFecha]') AND type = 'P')
DROP PROCEDURE [scafi].[spMotor_ActualizaContactosFecha]
GO

CREATE PROCEDURE [scafi].[spMotor_ActualizaContactosFecha]
	(
		@Indice int,
		@RutAfiliado int,
		@ValorDato varchar(250),
		@Token varchar(50),
		@Oficina int
	)
AS
BEGIN
	
	SET NOCOUNT ON;


--DECLARE @RUT_EJECUTIVO VARCHAR(50) = security.fnSca_ObtenerRutByToken(@Token)

IF @indice=1
	BEGIN 
				update BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad
				   set FechaIntento=GETDATE(),
					   ResultIntento='Contacto Valido', 
					   OrigenIntento='Motor',
					   FechaContacto=GETDATE(),
				       OrigenContacto = 'Motor',
				       FechaBaja = '1900-01-01 00:00:00.000',
					   OrigenBaja ='',
					   MotivoBaja ='',
				       RutEjecGEstion= security.fnSca_ObtenerRutByToken(@Token),
				       Oficina= @Oficina,
				       IndiceContactab= @indice
			where RutAfiliado=@RutAfiliado and ValorDato=@ValorDato
	END
IF @indice=2
BEGIN 

			update BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad
				   set FechaIntento=GETDATE(),
					   ResultIntento='Contactado', 
					   OrigenIntento='Motor',
					   FechaContacto=GETDATE(),
				       OrigenContacto = 'Motor',
				       FechaBaja = '1900-01-01 00:00:00.000',
					   OrigenBaja ='',
					   MotivoBaja ='',
				       RutEjecGEstion= security.fnSca_ObtenerRutByToken(@Token),
				       Oficina= @Oficina,
				       IndiceContactab= @indice
			where RutAfiliado=@RutAfiliado and ValorDato=@ValorDato
	END
IF @indice=3
BEGIN 

					update BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad
				   set FechaIntento=GETDATE(),
					   ResultIntento='Contactado', 
					   OrigenIntento='Motor',
					   FechaContacto=GETDATE(),
				       OrigenContacto = 'Motor',
				       FechaBaja = '1900-01-01 00:00:00.000',
					   OrigenBaja ='',
					   MotivoBaja ='',
				       RutEjecGEstion= security.fnSca_ObtenerRutByToken(@Token),
				       Oficina= @Oficina,
				       IndiceContactab= @indice
			where RutAfiliado=@RutAfiliado and ValorDato=@ValorDato
	END

IF @indice=4
BEGIN 

					update BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad
				   set FechaIntento=GETDATE(),
					   ResultIntento='No Contesta', 
					   OrigenIntento='Motor',
					   FechaContacto='1900-01-01 00:00:00.000',
				       OrigenContacto = '',
				       FechaBaja = '1900-01-01 00:00:00.000',
					   OrigenBaja ='',
					   MotivoBaja ='',
				       RutEjecGEstion= security.fnSca_ObtenerRutByToken(@Token),
				       Oficina= @Oficina,
				       IndiceContactab= @indice
			where RutAfiliado=@RutAfiliado and ValorDato=@ValorDato
	END
IF @indice=5
BEGIN 

					update BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad
				   set FechaIntento=GETDATE(),
					   ResultIntento='Ocupado', 
					   OrigenIntento='Motor',
					   FechaContacto='1900-01-01 00:00:00.000',
				       OrigenContacto = '',
				       FechaBaja = '1900-01-01 00:00:00.000',
					   OrigenBaja ='',
					   MotivoBaja ='',
				       RutEjecGEstion= security.fnSca_ObtenerRutByToken(@Token),
				       Oficina= @Oficina,
				       IndiceContactab= @indice
			where RutAfiliado=@RutAfiliado and ValorDato=@ValorDato
	END

IF @indice=6
BEGIN 

					update BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad
				   set FechaIntento=GETDATE(),
					   ResultIntento='Apagado', 
					   OrigenIntento='Motor',
					   FechaContacto='1900-01-01 00:00:00.000',
				       OrigenContacto = '',
				       FechaBaja = '1900-01-01 00:00:00.000',
					   OrigenBaja ='',
					   MotivoBaja ='',
				       RutEjecGEstion= security.fnSca_ObtenerRutByToken(@Token),
				       Oficina= @Oficina,
				       IndiceContactab= @indice
			where RutAfiliado=@RutAfiliado and ValorDato=@ValorDato
	END

  IF @indice=7
BEGIN 

					update BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad
				   set FechaIntento=GETDATE(),
					   ResultIntento='Equivocado', 
					   OrigenIntento='Motor',
					   FechaContacto=GETDATE(),
				       OrigenContacto = 'Motor',
				       FechaBaja = GETDATE(),
					   OrigenBaja ='Motor',
					   MotivoBaja ='Numero Equivocado',
				       RutEjecGEstion= security.fnSca_ObtenerRutByToken(@Token),
				       Oficina= @Oficina,
				       IndiceContactab= @indice
			where RutAfiliado=@RutAfiliado and ValorDato=@ValorDato
	END
    IF @indice=8
BEGIN 

					update BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad
				   set FechaIntento=GETDATE(),
					   ResultIntento='No Existe', 
					   OrigenIntento='Motor',
					   FechaContacto='1900-01-01 00:00:00.000',
				       OrigenContacto = 'Motor',
				       FechaBaja = GETDATE(),
					   OrigenBaja ='Motor',
					   MotivoBaja ='Numero No Existe',
				       RutEjecGEstion= security.fnSca_ObtenerRutByToken(@Token),
				       Oficina= @Oficina,
				       IndiceContactab= @indice
			where RutAfiliado=@RutAfiliado and ValorDato=@ValorDato
	END



END