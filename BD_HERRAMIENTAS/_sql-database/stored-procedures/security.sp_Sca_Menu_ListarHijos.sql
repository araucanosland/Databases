IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Menu_ListarHijos]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Menu_ListarHijos]
GO
CREATE procedure [security].[sp_Sca_Menu_ListarHijos]
(
	@codPadre INT,
	@Token VARCHAR(50)
)
AS
BEGIN

/*select b.Nombre, a.CodMenu
from security.TabSca_Menu a
inner join security.TabSca_Recurso b on a.CodRecurso = b.CodRecurso
where CodMenuPadre = @codPadre*/
	SELECT distinct r.Nombre, m.CodMenu, @Token Token, m.Orden
	FROM dbo.TabMotor_Dotacion a WITH (NOLOCK)
	INNER JOIN security.TabSca_AsignaPermiso b WITH (NOLOCK) on ((a.Rut = b.Grupo) OR (a.Cargo = b.Grupo) OR (b.Grupo = '*') )
	INNER JOIN security.TabSca_Permisos c WITH (NOLOCK) on b.CodPermiso = c.CodPermiso
	INNER JOIN security.TabSca_Recurso r WITH (NOLOCK) ON c.codRecurso = r.CodRecurso
	INNER JOIN security.TabSca_Menu m WITH (NOLOCK) ON r.CodRecurso = m.CodRecurso
	WHERE a.Periodo = (select max(Periodo) from dbo.TabMotor_Dotacion WITH (NOLOCK)) 
	AND a.Rut = security.fnSca_ObtenerRutByToken(@Token)
	AND m.CodMenuPadre = @codPadre
	AND m.Activo = 1
	ORDER BY m.Orden;

END