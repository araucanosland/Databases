IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[SP_Contacto_cargaListaBlanca]') AND type = 'P')
DROP PROCEDURE [dbo].[SP_Contacto_cargaListaBlanca]
GO
--Exec BD_HERRAMIENTAS.[dbo].[SP_Contacto_cargaListaBlanca]
CREATE Proc [dbo].[SP_Contacto_cargaListaBlanca]
as 

-------------------------------INSERTO los que no estan

Insert Into BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad
Select 
 Rut	RutAfiliado
,Case When id_Dato=2 Then 1 When id_Dato=1 Then 2 End iTipoDato
,Descripcion_Dato TipoDato
,1 iClasifDato
,'Personal' ClasifDato
,Dato_Formateado ValorDato
,Convert(datetime,Periodo) FechaCreacion
,Origen_Captura OrigenCreacion
,'1900-01-01'   FechaIntento	
,''   ResultIntento	
,''   OrigenIntento	
,'1900-01-01'   FechaContacto	
,''   OrigenContacto	
,'1900-01-01'   FechaBaja	
,''   OrigenBaja	
,''   MotivoBaja	
,''   RutEjecGEstion	
,0    Oficina	
,9   IndiceContactab	
,0   Ocultar
From [Serv-55].BD_ODS.dbo.TabContactos_ListaBlanca A
Left Join BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad B
On A.Rut=B.RutAfiliado And Right(A.Dato_Formateado,8)=Right(ValorDato,8)  And B.iTipoDato in (1,2)
Where id_Dato in (1,2)
And B.RutAfiliado is Null 



Insert Into BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad
Select 
 Rut	RutAfiliado
,3 iTipoDato
,Descripcion_Dato TipoDato
, iClasifDato
,'Personal' ClasifDato
,Dato_Formateado ValorDato
,Convert(datetime,Periodo) FechaCreacion
,Origen_Captura OrigenCreacion
,'1900-01-01'   FechaIntento	
,''   ResultIntento	
,''   OrigenIntento	
,'1900-01-01'   FechaContacto	
,''   OrigenContacto	
,'1900-01-01'   FechaBaja	
,''   OrigenBaja	
,''   MotivoBaja	
,''   RutEjecGEstion	
,0    Oficina	
,9   IndiceContactab	
,0   Ocultar 
From [Serv-55].BD_ODS.dbo.TabContactos_ListaBlanca A
Left Join BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad B
On A.Rut=B.RutAfiliado And A.Dato_Formateado=ValorDato  And B.iTipoDato in (3)
Where id_Dato in (3)
And B.RutAfiliado is Null 



-------------------------------Doy de Baja y Oculto por Lista Negra

-----------------DatoErroneo
 
UPdate A set 
 Ocultar=1
,IndiceContactab=8
,FechaBaja=getdate()
,OrigenBaja='ListaNegra'
,MotivoBaja=isNUll(Descrip_TipoElim,'')+' - '+isNUll(Descripcion_Rebote,'')+' - '+isNUll(B.Fecha,'')
--Select *
From BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad A with(index(idx_limpieza))
Inner Join  (
				Select  Rut,Dato,Descripcion_Rebote,Descrip_TipoElim,Left(Periodo+'01',8) fecha
				From [Serv-55].BD_ODS.dbo.TabContactos_Listanegra 
				Where id_TipoElim=1 And SMS=1 And ISNUMERIC(Rut)=1
				Union 
				Select  Rut,Dato,Descripcion_Rebote,Descrip_TipoElim,Left(Periodo+'01',8) fecha
				From [Serv-55].BD_ODS.dbo.TabContactos_Listanegra 
				Where id_TipoElim=1 And CallCenter=1 And ISNUMERIC(Rut)=1
			) B
On A.RutAfiliado=B.Rut And Right(A.ValorDato,8)=Right(B.Dato,8) 
Where A.iTipoDato in (1,2)
And A.IndiceContactab not in (7,8)
And Ocultar=0


UPdate A set 
 Ocultar=1
,IndiceContactab=8
,FechaBaja=getdate()
,OrigenBaja='ListaNegra'
,MotivoBaja=isNUll(Descrip_TipoElim,'')+' - '+isNUll(Descripcion_Rebote,'')+' - '+isNUll(B.Fecha,'')
--Select *
From BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad A with(index(idx_limpieza))
Inner Join  (
				Select  Rut,Dato,Descripcion_Rebote,Descrip_TipoElim,Left(Periodo+'01',8) fecha
				From [Serv-55].BD_ODS.dbo.TabContactos_Listanegra 
				Where id_TipoElim=1 And MAIL=1 And ISNUMERIC(Rut)=1
			) B
On A.RutAfiliado=B.Rut And A.ValorDato=B.Dato
Where A.iTipoDato in (3)
And A.IndiceContactab not in (7,8)
And Ocultar=0



-----------------Desuscrito


----Por Rut Y Dato
UPdate A set 
 Ocultar=1
,FechaBaja=getdate()
,OrigenBaja='ListaNegra'
,MotivoBaja=isNUll(Descrip_TipoElim,'')+' - '+isNUll(Descripcion_Rebote,'')+' - '+isNUll(B.Fecha,'')
--Select *
From BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad A with(index(idx_limpieza))
Inner Join  (
				Select  Rut,Dato,Descripcion_Rebote,Descrip_TipoElim,Left(Periodo+'01',8) fecha
				From [Serv-55].BD_ODS.dbo.TabContactos_Listanegra 
				Where id_TipoElim=2 And SMS=1   And Rut<>'' And Dato<>''
				Union 
				Select  Rut,Dato,Descripcion_Rebote,Descrip_TipoElim,Left(Periodo+'01',8) fecha
				From [Serv-55].BD_ODS.dbo.TabContactos_Listanegra 
				Where id_TipoElim=2 And CallCenter=1 And Rut<>'' And Dato<>''
			) B
On A.RutAfiliado=B.Rut And Right(A.ValorDato,8)=Right(B.Dato,8) 
Where A.iTipoDato in (1,2)
And A.IndiceContactab not in (7,8)
And Ocultar=0


UPdate A set 
 Ocultar=1
,FechaBaja=getdate()
,OrigenBaja='ListaNegra'
,MotivoBaja=isNUll(Descrip_TipoElim,'')+' - '+isNUll(Descripcion_Rebote,'')+' - '+isNUll(B.Fecha,'')
--Select *
From BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad A with(index(idx_limpieza))
Inner Join  (
				Select  Rut,Dato,Descripcion_Rebote,Descrip_TipoElim,Left(Periodo+'01',8) fecha
				From [Serv-55].BD_ODS.dbo.TabContactos_Listanegra 
				Where id_TipoElim=2 And MAIL=1 And Rut<>'' And Dato<>''
			) B
On A.RutAfiliado=B.Rut And A.ValorDato=B.Dato
Where A.iTipoDato in (3)
And A.IndiceContactab not in (7,8)
And Ocultar=0


----Por Rut 
UPdate A set 
 Ocultar=1
,FechaBaja=getdate()
,OrigenBaja='ListaNegra'
,MotivoBaja=isNUll(Descrip_TipoElim,'')+' - '+isNUll(Descripcion_Rebote,'')+' - '+isNUll(B.Fecha,'')
--Select *
From BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad A with(index(idx_limpieza))
Inner Join  (
				Select  Rut,Dato,Descripcion_Rebote,Descrip_TipoElim,Left(Periodo+'01',8) fecha
				From [Serv-55].BD_ODS.dbo.TabContactos_Listanegra 
				Where id_TipoElim=2 And Rut<>'' And Dato=''
			) B
On A.RutAfiliado=B.Rut
Where 1=1
And A.IndiceContactab not in (7,8)
And Ocultar=0


-----------------SERNAC

--Por Dato sin Rut
UPdate A set 
 Ocultar=1
,FechaBaja=getdate()
,OrigenBaja='ListaNegra'
,MotivoBaja=isNUll(Descrip_TipoElim,'')+' - '+isNUll(Descripcion_Rebote,'')+' - '+isNUll(B.Fecha,'')
--Select *
From BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad A with(index(idx_limpieza))
Inner Join  (
				Select  Rut,Dato,Descripcion_Rebote,Descrip_TipoElim,Left(Periodo+'01',8) fecha
				From [Serv-55].BD_ODS.dbo.TabContactos_Listanegra 
				Where id_TipoElim=3 And SMS=1   And Rut='' And Dato<>''
				Union 
				Select  Rut,Dato,Descripcion_Rebote,Descrip_TipoElim,Left(Periodo+'01',8) fecha
				From [Serv-55].BD_ODS.dbo.TabContactos_Listanegra 
				Where id_TipoElim=3 And CallCenter=1 And Rut='' And Dato<>''
			) B
On Right(A.ValorDato,8)=Right(B.Dato,8) 
Where A.iTipoDato in (1,2)
And A.IndiceContactab not in (7,8)
And Ocultar=0


UPdate A set 
 Ocultar=1
,FechaBaja=getdate()
,OrigenBaja='ListaNegra'
,MotivoBaja=isNUll(Descrip_TipoElim,'')+' - '+isNUll(Descripcion_Rebote,'')+' - '+isNUll(B.Fecha,'')
--Select *
From BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad A with(index(idx_limpieza))
Inner Join  (
				Select  Rut,Dato,Descripcion_Rebote,Descrip_TipoElim,Left(Periodo+'01',8) fecha
				From [Serv-55].BD_ODS.dbo.TabContactos_Listanegra 
				Where id_TipoElim=3 And MAIL=1 And Rut='' And Dato<>''
			) B
On  A.ValorDato=B.Dato
Where A.iTipoDato in (3)
And A.IndiceContactab not in (7,8)
And Ocultar=0


----Por Rut 
UPdate A set 
 Ocultar=1
,FechaBaja=getdate()
,OrigenBaja='ListaNegra'
,MotivoBaja=isNUll(Descrip_TipoElim,'')+' - '+isNUll(Descripcion_Rebote,'')+' - '+isNUll(B.Fecha,'')
--Select *
From BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad A with(index(idx_limpieza))
Inner Join  (
				Select  Rut,Dato,Descripcion_Rebote,Descrip_TipoElim,Left(Periodo+'01',8) fecha
				From [Serv-55].BD_ODS.dbo.TabContactos_Listanegra 
				Where id_TipoElim=3 And Rut<>''  
			) B
On convert(varchar,A.RutAfiliado)=B.Rut
Where A.IndiceContactab not in (7,8)
And Ocultar=0




-------------------------------Doy de Baja y Oculto los Malos por Motor


UPdate A set 
 Ocultar=1
From BD_HERRAMIENTAS.scafi.TabMotor_Contactibilidad A
Where A.IndiceContactab in (7,8)
And Ocultar=0 
And dateDiff(d,FechaBaja,getdate())>45



 

-----------------------------------------------------------------OLD
/* OLD
Insert into BD_HERRAMIENTAS.dbo.TabMotor_Contacto_Afiliado
Select 
 Rut Afiliado_Rut
,Convert(datetime,Periodo) Fecha_accion
,UPPER(Descripcion_Dato) Tipo_Contacto
,Dato_Formateado Valor_contacto
,1 Valido
,'1900-01-01 00:00:00.000' Fecha_contacto
From [Serv-55].BD_ODS.dbo.TabContactos_ListaBlanca A
Left Join BD_HERRAMIENTAS.dbo.TabMotor_Contacto_Afiliado B
ON A.Rut=B.Afiliado_rut And Right(A.Dato_Formateado,9)=Right(B.Valor_contacto,9) And B.Tipo_contacto in ('CELULAR','TELEFONO')
Where A.Id_Dato in(1,2) 
And B.Afiliado_rut is null
And Left(Periodo,6)>=Left(convert(varchar,dateadd(y,-1,Getdate()),112),6)	

*/