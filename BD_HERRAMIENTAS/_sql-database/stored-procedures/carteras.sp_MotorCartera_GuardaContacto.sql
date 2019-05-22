IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[sp_MotorCartera_GuardaContacto]') AND type = 'P')
DROP PROCEDURE [carteras].[sp_MotorCartera_GuardaContacto]
GO
CREATE PROCEDURE [carteras].[sp_MotorCartera_GuardaContacto](
@RutEmpresa varchar(12)
,@IdAnexo int 
,@Estamento int
,@RutContacto varchar(15) 
,@NombreContacto varchar(255)
,@Cargo varchar(255)
,@ContactoFijo int =0
,@ContactoCelular int =0
,@ContactoEmail varchar(255) = NULL

)
AS
BEGIN

	INSERT INTO BD_HERRAMIENTAS.carteras.TabCart_IngresoContacto
	VALUES(
			@RutEmpresa
			,@IdAnexo
			,@Estamento
			,@RutContacto
			,@NombreContacto
			,@Cargo
			,@ContactoFijo
			,@ContactoCelular
			,@ContactoEmail
			 )

END


--select * from BD_HERRAMIENTAS.carteras.TabCart_IngresoContacto