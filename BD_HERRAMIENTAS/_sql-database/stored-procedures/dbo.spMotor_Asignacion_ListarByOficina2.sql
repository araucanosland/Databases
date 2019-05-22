IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Asignacion_ListarByOficina2]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Asignacion_ListarByOficina2]
GO
CREATE PROCEDURE [dbo].[spMotor_Asignacion_ListarByOficina2]
	@Periodo AS int ,
  @TokenEjecutivo AS varchar(40),
	@TipoDerivacion varchar(50) = ''
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'

	declare @Ofi INT= security.fnSca_ObtenerOficinaByToken(@TokenEjecutivo)

select * , 0 total_reg
	from dbo.TabMotor_Asignacion a with(index(idx_ListarByOficina2))
	outer apply(
		select * 
	from dbo.TabMotor_Gestion xx with(index(DX4))
	where ges_bcam_uid = a.id_Asign
	and ges_fecha_accion = (select max(ges_fecha_accion) from dbo.TabMotor_Gestion xy  with(index(IDX_ID_ASIGNACION)) where xy.ges_bcam_uid = xx.ges_bcam_uid)
		) b
		where a.periodo=@Periodo
		and a.Oficina = @Ofi
		and a.TipoDerivacion = @TipoDerivacion

END