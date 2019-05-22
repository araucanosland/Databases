IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[SpMotor_Guarda_AfiliadoComentario]') AND type = 'P')
DROP PROCEDURE [dbo].[SpMotor_Guarda_AfiliadoComentario]
GO
CREATE PROCEDURE [dbo].[SpMotor_Guarda_AfiliadoComentario](
@RutAfiliado varchar(50),
@Observacion varchar(500),
@TokenEjecutivo varchar(100)
)
as
begin

Declare @RutEjecutivo varchar(50) = security.fnSca_ObtenerRutByToken(@TokenEjecutivo)
Declare @Fecha_Obs datetime = CONVERT (datetime, GETDATE())
Declare @CodOficina_ini int =  security.fnSca_ObtenerOficinaByToken(@TokenEjecutivo)
 

	INSERT INTO TabMotor_ObservacionAfiliado VALUES(@RutAfiliado, @Fecha_Obs, @Observacion, @RutEjecutivo, @CodOficina_ini) 
	
end