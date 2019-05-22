IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[sp_Sca_Menu_ListarCategorias]') AND type = 'P')
DROP PROCEDURE [security].[sp_Sca_Menu_ListarCategorias]
GO
CREATE procedure [security].[sp_Sca_Menu_ListarCategorias]
(
	@Token VARCHAR(50)
)
AS
BEGIN

--select * from security.TabSca_CategoriaMenu

SELECT distinct cm.*, @Token Token
	FROM dbo.TabMotor_Dotacion a WITH (NOLOCK)
	INNER JOIN security.TabSca_AsignaPermiso b WITH (NOLOCK) on ((a.Rut = b.Grupo) OR (a.Cargo = b.Grupo) OR (b.Grupo = '*') )
	INNER JOIN security.TabSca_Permisos c WITH (NOLOCK) on b.CodPermiso = c.CodPermiso
	INNER JOIN security.TabSca_Recurso r WITH (NOLOCK) ON c.codRecurso = r.CodRecurso
	INNER JOIN security.TabSca_Menu m WITH (NOLOCK) ON r.CodRecurso = m.CodRecurso
	INNER JOIN security.TabSca_CategoriaMenu cm WITH (NOLOCK) ON m.CodCategoria = cm.CodCategoria
	WHERE a.Periodo = (select max(Periodo) from dbo.TabMotor_Dotacion WITH (NOLOCK)) 
	AND a.Rut = security.fnSca_ObtenerRutByToken(@Token)
	ORDER BY cm.Orden

END