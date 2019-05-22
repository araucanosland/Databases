IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[SP_maeVenta]') AND type = 'P')
DROP PROCEDURE [mae].[SP_maeVenta]
GO
--use BD_Herramientas
--Exec BD_Herramientas.mae.SP_maeVenta 
CREATE Proc [mae].[SP_maeVenta] 
as 

declare @fe55  varchar(8)=(Select Max(FechaEjec) From [SERV-55].[BD_DM].[dbo].[Venta])
declare @mv55 varchar(8)=(Select Max(mesVenta) From [SERV-55].[BD_DM].[dbo].[Venta] Where FechaEjec=@fe55)
declare @fe280 varchar(8)=(Select Max(FechaEjec) From BD_Herramientas.mae.Venta)

Select @fe55,@mv55, @fe280

if @fe55 > @fe280
Begin 
		Delete BD_Herramientas.mae.Venta Where MesVenta=@mv55
		Insert Into BD_Herramientas.mae.Venta
		Select 
		 MesVenta
		,FechaEjec
		,RutAfiliado
		,FolioCredito			
		,Producto				
		,FechaColocacion		
		,Plazo					
		,TasaInteres			
		,MontoBruto				
		,MontoNetoReal			
		,RutEmpleadoCotizacion	
		,CodOficinaCurse		
		,OficinaCurse 			
		,CodOficinaCurseMadre	
		,OficinaCurseMadre 		
		,CodOficinaPago			
		,OficinaPago			
		,CodOficinaPagoMadre	
		,OficinaPagoMadre		
		,OfertaNum
		,ProgRecon_idGrupo	
		,ProgRecon_Grupo
		From [SERV-55].[BD_DM].[dbo].[Venta]
		Where MesVenta=@mv55
End