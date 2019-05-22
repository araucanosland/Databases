IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[sp_CargaAfiliados]') AND type = 'P')
DROP PROCEDURE [mae].[sp_CargaAfiliados]
GO
Create Proc [mae].[sp_CargaAfiliados]
 as 

Truncate Table BD_HERRAMIENTAS.mae.Afiliados
Insert Into BD_HERRAMIENTAS.mae.Afiliados 
Select * From [serv-55].BD_Motor.mae.Afiliados