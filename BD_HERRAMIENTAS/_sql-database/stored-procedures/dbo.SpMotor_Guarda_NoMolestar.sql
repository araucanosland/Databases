IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[SpMotor_Guarda_NoMolestar]') AND type = 'P')
DROP PROCEDURE [dbo].[SpMotor_Guarda_NoMolestar]
GO
CREATE PROCEDURE [dbo].[SpMotor_Guarda_NoMolestar](
@RutAfiliado varchar(50),
@Motivo varchar(200),
@TokenEjecutivo varchar(100)
)
as
begin

Declare @RutEjecutivo_ini varchar(50) = security.fnSca_ObtenerRutByToken(@TokenEjecutivo)
Declare @CodOficina_ini int =  security.fnSca_ObtenerOficinaByToken(@TokenEjecutivo)
Declare @Fecha_incio datetime = CONVERT (datetime, GETDATE())
Declare @Fecha_fin datetime = '9999-12-31'
Declare @FlagEstado int = 1

	insert into TabMotor_No_Molestar 
	values(@RutAfiliado, @Motivo, @Fecha_incio, @RutEjecutivo_ini, @CodOficina_ini, @Fecha_fin,'' ,'' , @FlagEstado)
end