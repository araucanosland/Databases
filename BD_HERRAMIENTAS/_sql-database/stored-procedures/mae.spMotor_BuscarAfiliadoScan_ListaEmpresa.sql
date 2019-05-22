IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[spMotor_BuscarAfiliadoScan_ListaEmpresa]') AND type = 'P')
DROP PROCEDURE [mae].[spMotor_BuscarAfiliadoScan_ListaEmpresa]
GO
--exec [mae].[spMotor_BuscarAfiliadoScan_ListaEmpresa] 17337578
CREATE procedure [mae].[spMotor_BuscarAfiliadoScan_ListaEmpresa]
(
	@RutAfiliado int
)
as
select rutempresa
	   ,convert(varchar,rutempresa)+'-'+dvempresa RutEmpresaDv
	   ,nombreempresa
 from mae.Afiliados
where RutAfiliado=@RutAfiliado