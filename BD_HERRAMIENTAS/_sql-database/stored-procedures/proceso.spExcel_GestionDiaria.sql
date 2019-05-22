IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[proceso].[spExcel_GestionDiaria]') AND type = 'P')
DROP PROCEDURE [proceso].[spExcel_GestionDiaria]
GO
CREATE PROCEDURE [proceso].[spExcel_GestionDiaria]
AS
BEGIN

--select 1

select 	o.Zona, 
				b.Oficina CodSucursal, 
				d.Sucursal, 
				ges_estado_gst iEstadoGestionHijo, 
				c.eges_nombre nEstadoGestionHijo,
				c1.eges_id iEstadoGestionPadre, 
				c1.eges_nombre nEstadoGestionPadre,
				ges_ejecutivo_rut RutEjecutivo, 
				d.Nombre NombresEjecutivo,  
				CONVERT(DATE, ges_fecha_compromete) FechaCompromiso, 
				CONVERT(DATE, ges_fecha_accion) FechaAccion, 
				CONVERT(VARCHAR(200), b.Afiliado_Rut) + '-' + b.Afiliado_Dv RutAfiliado,
				b.Nombre + ' ' + b.Apellido NombreAfiliado,
				a.ges_descripcion_gst Observacion
from BD_HERRAMIENTAS.dbo.TabMotor_Gestion a
inner join BD_HERRAMIENTAS.dbo.TabMotor_Asignacion b on a.ges_bcam_uid = b.id_Asign and b.TipoAsignacion = 1 and b.Periodo = CONVERT(VARCHAR(4), YEAR(GETDATE())) + '' + generales.LPAD(CONVERT(VARCHAR(2), MONTH(GETDATE())),2,'0')
inner join BD_HERRAMIENTAS.dbo.TabMotor_EstadoGestion c on a.ges_estado_gst = c.eges_id and c.ejes_tipo_campagna = 1
inner join BD_HERRAMIENTAS.dbo.TabMotor_EstadoGestion c1 on c.ejes_id_padre = c1.eges_id and c1.ejes_tipo_campagna = 1
inner join BD_HERRAMIENTAS.dbo.TabMotor_Dotacion d on a.ges_ejecutivo_rut = d.Rut and b.Periodo = d.Periodo and b.Oficina = d.Cod_Sucursal
inner join (select distinct Cod_Oficina, Cod_Zona, Zona from BD_HERRAMIENTAS.mae.Oficinas) o on b.Oficina = o.Cod_Oficina

where a.ges_fecha_accion = (select max(ges_fecha_accion) from BD_HERRAMIENTAS.dbo.TabMotor_Gestion xx where xx.ges_bcam_uid = a.ges_bcam_uid  )
order by ges_fecha_accion desc



END