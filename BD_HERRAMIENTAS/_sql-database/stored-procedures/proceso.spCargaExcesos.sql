IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[proceso].[spCargaExcesos]') AND type = 'P')
DROP PROCEDURE [proceso].[spCargaExcesos]
GO
CREATE PROCEDURE [proceso].[spCargaExcesos]
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

--truncate table TabMotor_Notificacion_Asignacion

DELETE FROM TabMotor_Notificacion_Asignacion WHERE Tipo='PAGEXCESO'

--insert into TabMotor_Notificacion_Asignacion
--select AFIRUT, 'PAGEXCESO' TIPO_P, SUM(CUOMONPAG + CUOVALANT + CUOGRAPAG) MONTO_APAGO, COUNT(AFIRUT) TOTAL_P
--from as400.araucana.rcdta.rc03f1
--where RC2CA = 1
--GROUP BY AFIRUT

/*==================================
	========  	CLAVES
	==================================

AFIRUT	: Rut del Afiliado.
RC2CA		: Estado del pago



*/


END