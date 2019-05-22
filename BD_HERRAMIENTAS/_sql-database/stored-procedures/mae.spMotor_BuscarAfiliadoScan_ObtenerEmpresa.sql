IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[mae].[spMotor_BuscarAfiliadoScan_ObtenerEmpresa]') AND type = 'P')
DROP PROCEDURE [mae].[spMotor_BuscarAfiliadoScan_ObtenerEmpresa]
GO
--exec [mae].[spMotor_BuscarAfiliadoScan_ObtenerEmpresa] 69020100,12937860
CREATE procedure [mae].[spMotor_BuscarAfiliadoScan_ObtenerEmpresa]
(
	@RutEmpresa int,
	@RutAfiliado int
)
as
select  rutempresa
	   ,convert(varchar,rutempresa)+'-'+dvempresa RutEmpresaDv
	   ,nombreempresa
	  ,left(B.Nombre_mes,3) +' '+left(b.Periodo,4)      PeriodoUltimaRenta
       ,RentaUltimaInformada
	         ,ltrim(replace(RolSegmentoAfiliado,'Afiliado','')) RolSegmentoAfiliado
 from mae.Afiliados a
 Left JOin mae.DIaHabil b on a.PeriodoUltimaRenta=b.Periodo 
where rutempresa=@RutEmpresa
and RutAfiliado=@RutAfiliado
and rutempresa not in (98000400,98001000)