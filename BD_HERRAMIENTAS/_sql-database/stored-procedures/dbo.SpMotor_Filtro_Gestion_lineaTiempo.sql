IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[SpMotor_Filtro_Gestion_lineaTiempo]') AND type = 'P')
DROP PROCEDURE [dbo].[SpMotor_Filtro_Gestion_lineaTiempo]
GO
--exec [dbo].[SpMotor_Filtro_Gestion_lineaTiempo]'9065257-5', 0
--exec [dbo].[SpMotor_Lista_Gestion_lineaTiempo]'15473876-2'  
--SELECT * FROM TABMOTOR_NO_MOLESTAR where RutAfiliado = '15473876-2'  
CREATE PROCEDURE [dbo].[SpMotor_Filtro_Gestion_lineaTiempo](  
@RutAfiliado varchar(50),
@Estado int  
)  
AS  

begin
IF @Estado !=0
begin
select *  
from (  
SELECT distinct convert(varchar, b.Afiliado_Rut) + '-' + b.Afiliado_Dv as RutAfiliado  
  ,a.ges_fecha_accion Fecha  
  ,e.eges_nombre Estado  
  ,d.eges_nombre SubEstado  
  ,b.Nombre + ' ' + b.Apellido Afiliado  
  ,c.Nombre Ejecutivo  
  ,c.Sucursal  
  ,b.PreAprobadoFinal  
  ,b.Periodo  
  ,1 EstadoGestion --'Gestion Motor'  
    
  FROM TabMotor_Gestion a  
  inner join TabMotor_Asignacion b on a.ges_bcam_uid = b.id_Asign  
  inner join TabMotor_Dotacion c on c.Rut = a.ges_ejecutivo_rut  
  inner join TabMotor_EstadoGestion d on a.ges_estado_gst = d.eges_id  
  inner join TabMotor_EstadoGestion e on d.ejes_id_padre = e.eges_id  
  WHERE ges_fecha_accion >= DATEADD(month,-5, CONVERT(datetime, GETDATE()))  
  AND b.Afiliado_Rut = LEFT(@RutAfiliado,CHARINDEX('-',@RutAfiliado)-1)  
    
union   
select distinct a.RutAfiliado  
  ,a.Fecha_Obs Fecha  
  ,'Comentarios' Observacion  
  ,a.Observacion  
  ,b.Nombres + ' ' + b.Apellidos Afiliado  
  ,c.Nombre Ejecutivo  
  ,c.Sucursal  
  ,0 Pa  
  ,'' Periodo  
  ,2 EstadoGestion --'Comentarios'  
  
 FROM TabMotor_ObservacionAfiliado a  
 inner join mae.Afiliados b on a.RutAfiliado = convert(VARCHAR(20),b.RutAfiliado) + '-' + b.DvAfiliado  
 inner join dbo.TabMotor_Dotacion c on a.RutEjecutivo = c.Rut  
 where b.RutAfiliado = LEFT(@RutAfiliado,CHARINDEX('-',@RutAfiliado)-1)  
 and a.RutAfiliado  = @RutAfiliado  
 union  
 select distinct a.RutAfiliado  
   ,a.Fecha_iniEjec Fecha  
   ,'No Molestar' Motivo  
   ,a.Motivo  
   ,b.Nombres + ' ' + b.Apellidos Afiliado  
   ,c.Nombre Ejecutivo  
   ,c.Sucursal  
   ,0 Pa  
   ,'' Periodo  
   ,3 EstadoGestion --'No Molestar'  
     
 FROM TabMotor_No_Molestar a  
 inner join mae.Afiliados b on a.RutAfiliado = convert(VARCHAR(20),b.RutAfiliado) + '-' + b.DvAfiliado  
 inner join dbo.TabMotor_Dotacion c on a.RutEjecutivoIni = c.Rut  
 where b.RutAfiliado = LEFT(@RutAfiliado,CHARINDEX('-',@RutAfiliado)-1)  
 and a.RutAfiliado  = @RutAfiliado and a.Motivo <> ''  
  union  
 select distinct a.RutAfiliado  
   ,a.Fecha_finEjec Fecha  
   ,'Desactiva No Molestar' Motivo  
   ,'Se quita estado no molestar' Motivo  
   ,b.Nombres + ' ' + b.Apellidos Afiliado  
   ,c.Nombre Ejecutivo  
   ,c.Sucursal  
   ,0 Pa  
   ,'' Periodo  
   ,4 EstadoGestion --'Desactiva Molestar'  
     
 FROM TabMotor_No_Molestar a  
 inner join mae.Afiliados b on a.RutAfiliado = convert(VARCHAR(20),b.RutAfiliado) + '-' + b.DvAfiliado  
 inner join dbo.TabMotor_Dotacion c on a.RutEjecutivoFin = c.Rut  
 where b.RutAfiliado = LEFT(@RutAfiliado,CHARINDEX('-',@RutAfiliado)-1)  
 and a.RutAfiliado  = @RutAfiliado   
) Proyeccion
where Proyeccion.EstadoGestion = @Estado 
order by Fecha desc
end
 
else
  BEGIN
  select *  
from (  
SELECT distinct convert(varchar, b.Afiliado_Rut) + '-' + b.Afiliado_Dv as RutAfiliado  
  ,a.ges_fecha_accion Fecha  
  ,e.eges_nombre Estado  
  ,d.eges_nombre SubEstado  
  ,b.Nombre + ' ' + b.Apellido Afiliado  
  ,c.Nombre Ejecutivo  
  ,c.Sucursal  
  ,b.PreAprobadoFinal  
  ,b.Periodo  
  ,1 EstadoGestion --'Gestion Motor'  
    
  FROM TabMotor_Gestion a  
  inner join TabMotor_Asignacion b on a.ges_bcam_uid = b.id_Asign  
  inner join TabMotor_Dotacion c on c.Rut = a.ges_ejecutivo_rut  
  inner join TabMotor_EstadoGestion d on a.ges_estado_gst = d.eges_id  
  inner join TabMotor_EstadoGestion e on d.ejes_id_padre = e.eges_id  
  WHERE ges_fecha_accion >= DATEADD(month,-5, CONVERT(datetime, GETDATE()))  
  AND b.Afiliado_Rut = LEFT(@RutAfiliado,CHARINDEX('-',@RutAfiliado)-1)  
    
union   
select distinct a.RutAfiliado  
  ,a.Fecha_Obs Fecha  
  ,'Comentarios' Observacion  
  ,a.Observacion  
  ,b.Nombres + ' ' + b.Apellidos Afiliado  
  ,c.Nombre Ejecutivo  
  ,c.Sucursal  
  ,0 Pa  
  ,'' Periodo  
  ,2 EstadoGestion --'Comentarios'  
  
 FROM TabMotor_ObservacionAfiliado a  
 inner join mae.Afiliados b on a.RutAfiliado = convert(VARCHAR(20),b.RutAfiliado) + '-' + b.DvAfiliado  
 inner join dbo.TabMotor_Dotacion c on a.RutEjecutivo = c.Rut  
 where b.RutAfiliado = LEFT(@RutAfiliado,CHARINDEX('-',@RutAfiliado)-1)  
 and a.RutAfiliado  = @RutAfiliado  
 union  
 select distinct a.RutAfiliado  
   ,a.Fecha_iniEjec Fecha  
   ,'No Molestar' Motivo  
   ,a.Motivo  
   ,b.Nombres + ' ' + b.Apellidos Afiliado  
   ,c.Nombre Ejecutivo  
   ,c.Sucursal  
   ,0 Pa  
   ,'' Periodo  
   ,3 EstadoGestion --'No Molestar'  
     
 FROM TabMotor_No_Molestar a  
 inner join mae.Afiliados b on a.RutAfiliado = convert(VARCHAR(20),b.RutAfiliado) + '-' + b.DvAfiliado  
 inner join dbo.TabMotor_Dotacion c on a.RutEjecutivoIni = c.Rut  
 where b.RutAfiliado = LEFT(@RutAfiliado,CHARINDEX('-',@RutAfiliado)-1)  
 and a.RutAfiliado  = @RutAfiliado and a.Motivo <> ''  
  union  
 select distinct a.RutAfiliado  
   ,a.Fecha_finEjec Fecha  
   ,'Desactiva No Molestar' Motivo  
   ,'Se quita estado no molestar' Motivo  
   ,b.Nombres + ' ' + b.Apellidos Afiliado  
   ,c.Nombre Ejecutivo  
   ,c.Sucursal  
   ,0 Pa  
   ,'' Periodo  
   ,4 EstadoGestion --'Desactiva Molestar'  
     
 FROM TabMotor_No_Molestar a  
 inner join mae.Afiliados b on a.RutAfiliado = convert(VARCHAR(20),b.RutAfiliado) + '-' + b.DvAfiliado  
 inner join dbo.TabMotor_Dotacion c on a.RutEjecutivoFin = c.Rut  
 where b.RutAfiliado = LEFT(@RutAfiliado,CHARINDEX('-',@RutAfiliado)-1)  
 and a.RutAfiliado  = @RutAfiliado   
) Proyeccion
order by Fecha desc  
  end 
end