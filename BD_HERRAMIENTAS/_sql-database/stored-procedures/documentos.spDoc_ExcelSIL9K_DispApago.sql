IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[documentos].[spDoc_ExcelSIL9K_DispApago]') AND type = 'P')
DROP PROCEDURE [documentos].[spDoc_ExcelSIL9K_DispApago]
GO
CREATE PROCEDURE [documentos].[spDoc_ExcelSIL9K_DispApago]
  @RutEmpresa AS int ,
  @CodOficina AS int 
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'





--		Select 
--		 Afiliado_Rut
--		,Afiliado_Dv
--		,Afiliado_Nombre
--		,Licencia_Folio
--		,Fecha_Inicio
--		,Fecha_Termino
--		,Licencia_Dias
--		,Dias_Pago
--		,Monto_Pago
--		,Licencia_Tipo
--		,Mes_Prescripcion
--		From [serv-55].BD_MOTOR.lm.TabMotor_LM_DisponiblePago
--		Where Cod_Sucursal=@CodOficina
--		And Empresa_Rut=@RutEmpresa

--union all

--Select 
--		 null Afiliado_Rut
--		,null Afiliado_Dv
--		,'' Afiliado_Nombre
--		,null Licencia_Folio
--		,null Fecha_Inicio
--		,null Fecha_Termino
--		,null Licencia_Dias
--		,null Dias_Pago
--		,null Monto_Pago
--		,'' Licencia_Tipo
--		,'' Mes_Prescripcion
		

		select 'ERROR: PROCEDIMIENTO LLAMADO REMOTO'


END