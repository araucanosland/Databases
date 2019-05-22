IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[Modelo_Negocios]') AND type = 'V')
DROP VIEW [dbo].[Modelo_Negocios]
GO
CREATE VIEW [dbo].[Modelo_Negocios]
AS
SELECT     fichas.TabFicha_Cuestionario.cuest_id, fichas.TabFicha_Cuestionario.descripcion, fichas.TabFicha_Pregunta.preg_id, fichas.TabFicha_Pregunta.cuestionario_id, 
                      fichas.TabFicha_Pregunta.titulo, fichas.TabFicha_Pregunta.item, fichas.TabFicha_Pregunta.pregunta_relacionada, fichas.TabFicha_Respuesta.resp_id, 
                      fichas.TabFicha_Respuesta.nuberespuesta_id, fichas.TabFicha_Respuesta.pregunta_id, fichas.TabFicha_NubeRespuestas.nresp_id, 
                      fichas.TabFicha_NubeRespuestas.despriccion, fichas.TabFicha_NubeRespuestas.valor, fichas.TabFicha_NubeRespuestas.tag, fichas.TabFicha_Desarrollo.desa_id, 
                      fichas.TabFicha_Desarrollo.encabezado_id, fichas.TabFicha_Desarrollo.respuesta_id, fichas.TabFicha_Desarrollo.texto, fichas.TabFicha_Encabezado.enc_id, 
                      fichas.TabFicha_Encabezado.cuestionario_id AS Expr1, fichas.TabFicha_Encabezado.rut_empresa, fichas.TabFicha_Encabezado.estamento, 
                      fichas.TabFicha_Encabezado.nombre_funcionario, fichas.TabFicha_Encabezado.cargo_funcionario, fichas.TabFicha_Encabezado.cantidad_empleados, 
                      fichas.TabFicha_Encabezado.cod_sucursal, fichas.TabFicha_Encabezado.rut_ejecutivo, fichas.TabFicha_Encabezado.nombre_empresa, 
                      fichas.TabFicha_Encabezado.fecha_entrevista, fichas.TabFicha_Encabezado.fecha_actualizacion, fichas.TabFicha_Encabezado.nombre_sucursal_empresa, 
                      fichas.TabFicha_Agenda.age_id, fichas.TabFicha_Agenda.encabezado_id AS Expr2, fichas.TabFicha_Agenda.fecha, fichas.TabFicha_Agenda.estamento AS Expr3, 
                      fichas.TabFicha_Agenda.nombre_funcionario AS Expr4, fichas.TabFicha_Agenda.cargo_funcionario AS Expr5, fichas.TabFicha_Contacto.cnt_id, 
                      fichas.TabFicha_Contacto.encabezado_id AS Expr6, fichas.TabFicha_Contacto.nombre, fichas.TabFicha_Contacto.telefono, fichas.TabFicha_Contacto.email, 
                      fichas.TabFicha_Contacto.direccion, fichas.TabFicha_Contacto.compromisos, fichas.TabFicha_Contacto.tipo
FROM         fichas.TabFicha_Cuestionario INNER JOIN
                      fichas.TabFicha_Pregunta ON fichas.TabFicha_Cuestionario.cuest_id = fichas.TabFicha_Pregunta.cuestionario_id INNER JOIN
                      fichas.TabFicha_Respuesta ON fichas.TabFicha_Pregunta.preg_id = fichas.TabFicha_Respuesta.pregunta_id INNER JOIN
                      fichas.TabFicha_NubeRespuestas ON fichas.TabFicha_Respuesta.nuberespuesta_id = fichas.TabFicha_NubeRespuestas.nresp_id INNER JOIN
                      fichas.TabFicha_Desarrollo ON fichas.TabFicha_Respuesta.resp_id = fichas.TabFicha_Desarrollo.respuesta_id INNER JOIN
                      fichas.TabFicha_Encabezado ON fichas.TabFicha_Cuestionario.cuest_id = fichas.TabFicha_Encabezado.cuestionario_id AND 
                      fichas.TabFicha_Desarrollo.encabezado_id = fichas.TabFicha_Encabezado.enc_id INNER JOIN
                      fichas.TabFicha_Agenda ON fichas.TabFicha_Encabezado.enc_id = fichas.TabFicha_Agenda.encabezado_id INNER JOIN
                      fichas.TabFicha_Contacto ON fichas.TabFicha_Encabezado.enc_id = fichas.TabFicha_Contacto.encabezado_id