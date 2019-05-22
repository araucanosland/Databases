IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[SP_maeOfertas]') AND type = 'P')
DROP PROCEDURE [mae].[SP_maeOfertas]
GO
--use BD_Herramientas
--Exec BD_Herramientas.mae.SP_maeOfertas
CREATE Proc [mae].[SP_maeOfertas] as


--declare @fe55	varchar(10)= (Select Max(FECHA_CREA_OFERTA) From [SERV-55].[BD_ODS].[dbo].TabCred_OfertaStockDiario)
--declare @p55	varchar(10)= (Select Left(Replace(Max(FECHA_CREA_OFERTA),'-',''),6) From [SERV-55].[BD_ODS].[dbo].TabCred_OfertaStockDiario Where FECHA_CREA_OFERTA=@fe55)
--declare @fe280	varchar(10)=(Select Max(FECHA_CREA_OFERTA) From BD_Herramientas.mae.Ofertas)

--Select @fe55,@p55, @fe280

--if @fe55 > @fe280
--Begin 
--		Delete BD_Herramientas.mae.Ofertas Where Left(Replace(FECHA_CREA_OFERTA,'-',''),6)=@p55
--		Insert Into BD_Herramientas.mae.Ofertas
--		Select * 
--		From ( 
--				Select 
--				 RUT_SOLICITA
--				,NUM_OFERTA	
--				,FECHA_CREA_OFERTA		
--				,HORA_CREA_OFERTA		
--				,FECHA_EST_OFERTA		
--				,HORA_EST_OFERTA			
--				,O.ID_EstadoOferta		
--				,EO.NOMBRE_ESTADOOFERTA		
--				,IDUSUARIO_OPERA		
--				,ROW_NUMBER() Over (Partition By RUT_SOLICITA Order By FECHA_CREA_OFERTA Desc,HORA_CREA_OFERTA Desc) AS rnk 
--				From [SERV-55].[BD_ODS].[dbo].TabCred_OfertaStockDiario O
--				Left JOin [SERV-55].[BD_ODS].[dbo].TabDim_Oferta_EstadoOferta EO
--				ON O.ID_EstadoOferta=EO.ID_EstadoOferta
--				Where Left(Replace(FECHA_CREA_OFERTA,'-',''),6)=@p55
--				And Len(RUT_SOLICITA)>3 
--		) O
--		Where rnk=1 
--End

 
  select 'ERROR: PROCEDIMIENTO LLAMADO REMOTO'