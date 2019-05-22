IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ObtieneDatosEjecutivo]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ObtieneDatosEjecutivo]
GO
CREATE PROCEDURE [dbo].[spMotor_ObtieneDatosEjecutivo](
@Rut varchar(11)
)
AS
BEGIN

Select Rut, Nombre, Cargo, TipoContrato, FechaIngreso, FechaFinalizacion, Correo, Sexo From dbo.TabMotor_Dotacion 
WHERE  Rut= @Rut
and Periodo = (select MAX(Periodo) from BD_Herramientas..TabMotor_Asignacion)

END