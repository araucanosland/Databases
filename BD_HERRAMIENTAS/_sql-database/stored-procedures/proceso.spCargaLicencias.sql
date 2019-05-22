IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[proceso].[spCargaLicencias]') AND type = 'P')
DROP PROCEDURE [proceso].[spCargaLicencias]
GO
CREATE PROCEDURE [proceso].[spCargaLicencias]
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

--truncate table TabMotor_Notificacion_Asignacion

DELETE FROM TabMotor_Notificacion_Asignacion WHERE Tipo='LICENCIA'

insert into TabMotor_Notificacion_Asignacion
select [RUT AFILIADO], 'LICENCIA' T, SUM(CONVERT(NUMERIC,[MONTO PAGO])) MNT, COUNT(*) N
from Staging.dbo.LICENCIAS_MOTORNEGOCIOS
where [ESTADO PAGO TESORE] = 'GENERADO'
and [FECHA DE COBRO] = ''
and [TIPO DE CONVENIO] = 'PAGO DIRECTO'
GROUP BY [RUT AFILIADO]



END