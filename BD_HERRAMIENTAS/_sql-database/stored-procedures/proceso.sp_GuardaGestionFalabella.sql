IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[proceso].[sp_GuardaGestionFalabella]') AND type = 'P')
DROP PROCEDURE [proceso].[sp_GuardaGestionFalabella]
GO
CREATE PROCEDURE [proceso].[sp_GuardaGestionFalabella]
  @Ticket AS varchar(70) ,
  @RutAfiliado AS varchar(20) ,
  @Beneficios AS varchar(MAX) ,
  @Correo AS varchar(200) ,
  @MontoRef AS int ,
  @Observacion AS varchar(MAX) ,
  @Telefono AS varchar(20) ,
  @TipoGestion AS varchar(50) ,
  @Token AS varchar(70) 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'
	declare @RutEjec VARCHAR(50) = security.fnSca_ObtenerRutByToken(@Token)
	declare @OficinaEjec INT = security.fnSca_ObtenerOficinaByToken(@Token)

	insert into Afiliado_Falabella_Gestion 
	values (
			 @Ticket
			,@RutAfiliado
			,@TipoGestion
			,@Observacion
			,@MontoRef
			,@Beneficios
			,@RutEjec
			,@OficinaEjec
			,@Telefono
			,@Correo
	);


END