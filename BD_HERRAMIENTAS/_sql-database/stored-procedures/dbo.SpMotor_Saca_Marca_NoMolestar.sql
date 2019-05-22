IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[SpMotor_Saca_Marca_NoMolestar]') AND type = 'P')
DROP PROCEDURE [dbo].[SpMotor_Saca_Marca_NoMolestar]
GO
CREATE PROCEDURE [dbo].[SpMotor_Saca_Marca_NoMolestar](
@RutAfiliado varchar(50),
@TokenEjecutivo varchar(100)
)
AS
BEGIN

DECLARE @FechaIniEje DATETIME
DECLARE @RutEjecIni VARCHAR(50)
DECLARE @CodOficIni INT

SELECT @FechaIniEje=Fecha_iniEjec, @RutEjecIni=RutEjecutivoIni, @CodOficIni=CodOficina_ini FROM TabMotor_No_Molestar
							WHERE Id_NoMolestar = (SELECT MAX(Id_NoMolestar)
							FROM TabMotor_No_Molestar where RutAfiliado = @RutAfiliado
							GROUP BY RutAfiliado) and RutAfiliado = @RutAfiliado
														
DECLARE @RutEjecutivoFin varchar(50) = security.fnSca_ObtenerRutByToken(@TokenEjecutivo)
DECLARE @CodOficinaFin int =  security.fnSca_ObtenerOficinaByToken(@TokenEjecutivo)
DECLARE @Fecha_finEje datetime = CONVERT (datetime, GETDATE())
DECLARE @FlagEstado int = 0
DECLARE @Motivo VARCHAR(500) = 'Se desactiva No Molestar'
		
	INSERT INTO TabMotor_No_Molestar VALUES(@RutAfiliado, '', @FechaIniEje, @RutEjecIni, @CodOficIni, @Fecha_finEje, @RutEjecutivoFin, @CodOficinaFin, @FlagEstado)			


						
END