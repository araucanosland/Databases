IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[scafi].[sp_MotorGuardarContactoNuevo]') AND type = 'P')
DROP PROCEDURE [scafi].[sp_MotorGuardarContactoNuevo]
GO
CREATE procedure [scafi].[sp_MotorGuardarContactoNuevo]

(
@RutAfiliado int,
@iTipoDato int,
@TipoDato varchar(50),
@iClasifDato int,
@ClasifDato varchar(50),
@ValorDato varchar(250)
)
as
INSERT INTO [scafi].[TabMotor_Contactibilidad]
           ([RutAfiliado]
           ,[iTipoDato]
           ,[TipoDato]
           ,[iClasifDato]
           ,[ClasifDato]
           ,[ValorDato]
           ,[FechaCreacion]
           ,[OrigenCreacion]
           ,[FechaIntento]
           ,[ResultIntento]
           ,[OrigenIntento]
           ,[FechaContacto]
           ,[OrigenContacto]
           ,[FechaBaja]
           ,[OrigenBaja]
           ,[MotivoBaja]
           ,[RutEjecGEstion]
           ,[Oficina]
           ,[IndiceContactab]
           ,[Ocultar])
     VALUES
           (@RutAfiliado
           ,@iTipoDato
           ,@TipoDato
           ,@iClasifDato
           ,@ClasifDato
           ,@ValorDato
           ,getdate()
           ,'Motor Nuevo'
           ,'1900-01-01 00:00:00.000'
           ,''
           ,''
           ,getdate()--'1900-01-01 00:00:00.000'
           ,''
           ,'1900-01-01 00:00:00.000'
           ,''
           ,''
           ,''
           ,0
           ,1
           ,0)