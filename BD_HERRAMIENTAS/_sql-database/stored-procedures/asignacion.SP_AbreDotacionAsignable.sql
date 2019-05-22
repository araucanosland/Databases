IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[asignacion].[SP_AbreDotacionAsignable]') AND type = 'P')
DROP PROCEDURE [asignacion].[SP_AbreDotacionAsignable]
GO
CREATE proc [asignacion].[SP_AbreDotacionAsignable] (
 @mes	varchar(50)	
,@f		varchar(50)
,@f1	varchar(6)
,@f2	datetime
)

as 

 ------------------- Inserta Nueva Noticia
--Declare 
-- @mes	varchar(50)	='Abril'
--,@f		varchar(50)	='Viernes 23 de Marzo hasta las 18:30 hrs'

Declare @idNew int	= (Select Max(noti_id) +1 From BD_HERRAMIENTAS..TabMotor_Noticia) 

Insert Into  BD_HERRAMIENTAS..TabMotor_Noticia
Select 
 @idNew 
,'Proceso Asignación '+@Mes
,'<div style="text-align:justify;">

<p>Hola! con el fin de realizar la asignación del nuevo mes, necesitamos que nos ayudes validando la <br/>
Dotación, además los <u>Ejecutivos que realizarán Gestión de Campaña durante el mes de '+@mes+'</u>, <br/>
en base a lo que nos indiques, realizaremos la carga de las Campañas</p>

<p>Para apoyarte con esta tarea, hemos habilitado en tu Motor, en menú <u><b>Herramienta / Dotación / Asignable</b></u>, <br/>
la herramienta en la cual debes activar (verde) aquellos Ejecutivos a los que se les asignará Campaña y </br>
desactivar(Gris) los que no, luego presionar el botón Guardar.</p>

<p><h4 class="text-primary"><u>Esta herramienta estará disponible hasta<br/> 
el día '+@f+', después, se cerrará el proceso</u></h4>
y utilizaremos lo que esté cargado para realizar la asignación.</p>

<p>Un Abrazo</p>

<p>Motor de Negocios</p>


</div>'
,1
,getdate()

Select* From BD_HERRAMIENTAS..TabMotor_Noticia
--delete BD_HERRAMIENTAS..TabMotor_Noticia where noti_id in (6,7,8)

----- Activa a los Agentes la noticia

UPdate A Set Usr_noticia_Inicio=@idNew
FROM [BD_HERRAMIENTAS].[security].[TabSca_Usuario] A
Inner Join BD_HERRAMIENTAS..TabMotor_Dotacion B
ON A.usr_rut=B.Rut ANd B.Periodo=(Select Max(periodo) From BD_HERRAMIENTAS..TabMotor_Dotacion)  And Cargo='Agente' 

Select* FROM [BD_HERRAMIENTAS].[security].[TabSca_Usuario] A Where usr_noticia_inicio=(Select Max(noti_id) From BD_HERRAMIENTAS..TabMotor_Noticia)

--Select* FROM [BD_HERRAMIENTAS].[security].[TabSca_Usuario] A Where usr_noticia_inicio=6
--UPdate [BD_HERRAMIENTAS].[security].[TabSca_Usuario] set usr_noticia_inicio=0 Where usr_noticia_inicio=6

----- Abre proceso de Asignacion Dotacion
UPdate BD_HERRAMIENTAS.[dbo].[TabMotor_PeriodoAsignacionDotacion] set PeriodoAbierto=0

Insert Into BD_HERRAMIENTAS.[dbo].[TabMotor_PeriodoAsignacionDotacion]
Select 
 @f1
,Getdate()
,Convert(datetime,@f2)
,1

Select* From BD_HERRAMIENTAS.[dbo].[TabMotor_PeriodoAsignacionDotacion]
--Delete BD_HERRAMIENTAS.[dbo].[TabMotor_PeriodoAsignacionDotacion] where periodo=201806