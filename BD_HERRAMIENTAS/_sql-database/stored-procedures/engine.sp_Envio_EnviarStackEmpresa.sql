IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[sp_Envio_EnviarStackEmpresa]') AND type = 'P')
DROP PROCEDURE [engine].[sp_Envio_EnviarStackEmpresa]
GO
CREATE PROCEDURE [engine].[sp_Envio_EnviarStackEmpresa]
(
	@EmpresaRut VARCHAR(20),
	@Oficina INT,
	@EmpresaNombre VARCHAR(200)
)
AS
BEGIN

declare @N_AsignacionesEmpresa INT, @N_GestionadosEmpresa INT, @N_ExisteEntidad INT, @N_PendientesDocs INT, @N_ExisteAsignacion INT, @_CodASG INT


select @N_AsignacionesEmpresa = COUNT(*) 
from engine.Asignacion 
where CodCamp = 6
and CodOficina = @Oficina
and CodAsignacion in (
	select CodAsignacion
	from engine.AttrValores 
	where CodCamp = 6
	and CodAttr = 'EmpresaRut'
	and ValorAttr = @EmpresaRut
)


select @N_GestionadosEmpresa = COUNT(*)
from engine.Gestion 
where CodAsignacion in (
	select CodAsignacion
	from engine.AttrValores 
	where CodCamp = 6
	and CodAttr = 'EmpresaRut'
	and ValorAttr = @EmpresaRut
)
and CodOficina = @Oficina


select @N_PendientesDocs = COUNT(*)
from engine.Gestion 
where CodAsignacion in (
	select CodAsignacion
	from engine.AttrValores 
	where CodCamp = 6
	and CodAttr = 'EmpresaRut'
	and ValorAttr = @EmpresaRut
)
and CodEstadoGestion = 73
and CodOficina = @Oficina



IF @N_GestionadosEmpresa < @N_AsignacionesEmpresa
BEGIN
			RAISERROR ('No todos los registros estan con gestión favor ver!',16,1);
END
ELSE IF @N_PendientesDocs = 0
BEGIN
			RAISERROR ('No hay casos con documentacion pendiente para enviar',16,1);
END
ELSE
BEGIN

	SELECT @N_ExisteEntidad = COUNT(*)
	FROM engine.Entidad 
	WHERE RutEntidad = LEFT(@EmpresaRut,CHARINDEX('-',@EmpresaRut)-1)

	IF @N_ExisteEntidad = 0
	BEGIN
		INSERT INTO engine.Entidad VALUES (LEFT(@EmpresaRut,CHARINDEX('-',@EmpresaRut)-1), RIGHT(@EmpresaRut,1),@EmpresaNombre, 1);
	END

	SELECT @N_ExisteAsignacion = COUNT(*) 
	FROM engine.Asignacion 
	WHERE CodCamp = 7 AND RutEntidad = LEFT(@EmpresaRut,CHARINDEX('-',@EmpresaRut)-1)
	AND CodOficina = @Oficina

	IF @N_ExisteAsignacion > 0 
	BEGIN 
		RAISERROR ('No puede enviar la empresa mas de una vez',16,1);


		--select @_CodASG = CodAsignacion
		--from engine.Asignacion b 
		--where b.CodCamp = 7 
		--and b.RutEntidad =  LEFT(@EmpresaRut,CHARINDEX('-',@EmpresaRut)-1)
		--and b.CodOficina = @Oficina


		--update engine.AttrValores set ValorAttr = @N_PendientesDocs
		--where CodAttr = 'CantidadLicencias' and codCamp = 7 and CodAsignacion = @_CodASG
	END
	ELSE
	BEGIN

		INSERT INTO engine.Asignacion(CodCamp, RutEntidad, RutEjecutivo, CodOficina, CampoClaveDuplicados, Activa) VALUES (
			7, LEFT(@EmpresaRut,CHARINDEX('-',@EmpresaRut)-1), '[{"cargo":"Agente"},{"cargo":"Ejecutivo Empresas y Trabajadores"}, {"cargo":"Jefe Empresas y Trabajadores"}]', @Oficina, null, 1
		)


		insert into engine.AttrValores
		select 'CantidadLicencias', 7, CodAsignacion , @N_PendientesDocs
		from engine.Asignacion b 
		where b.CodCamp = 7 
		and b.RutEntidad =  LEFT(@EmpresaRut,CHARINDEX('-',@EmpresaRut)-1)
		and b.CodOficina = @Oficina

	END

	SELECT	1 Entrega
END


END