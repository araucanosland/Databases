IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[alertafi].[spMotor_ListarAlertas]') AND type = 'P')
DROP PROCEDURE [alertafi].[spMotor_ListarAlertas]
GO
--exec [alertafi].[spMotor_ListarAlertas] 9730840
CREATE procedure [alertafi].[spMotor_ListarAlertas]

 @RutAfiliado int
as
select * from (
select distinct
		 A.AfiliadoRut RutAfiliado
		,case when Tipo='DISPONIBLE PARA PAGO' then 'Licencia Medica Disponible para Pago'
		when Tipo='LICENCIA' then 'Licencia Medica Pendiente'
		when Tipo='PAGEXCESO' then 'Pago en Exceso'
		end
		Tipo
		,'Moneda' TipoAlerta
		,case when tipo='DISPONIBLE PARA PAGO' then Convert(varchar,sum(convert(int,A.valor)))
		when A.tipo='LICENCIA' then Convert(varchar,sum(convert(int,A.valor)))
		when A.tipo='PAGEXCESO' then Convert(varchar,sum(convert(int,A.valor)))
		end valor
from BD_HERRAMIENTAS.alertafi.TabMotor_AfiAlertas A
--where A.AfiliadoRut=@RutAfiliado
group by A.AfiliadoRut
		,A.AfiRutDv
		,A.Tipo
union all	
		select distinct
		RutAfiliado,
		'Afiliado de Cumpleaños' Tipo,
		'Fecha' TipoAlerta,
		LEFT(convert(varchar, getdate(), 100),LEN(convert(varchar, getdate(), 100))-12) Valor--left(convert(varchar(11),FechaNacimiento,105),5) Valor
		from BD_HERRAMIENTAS.mae.Afiliados 
where convert(varchar,right(FechaNacimiento,5))=right(convert(date,GETDATE()),5) 
--and RutAfiliado=@RutAfiliado
union all
		select distinct
		RutAfiliado,
		'Afiliado Nuevo ' Tipo,
		'Fecha' TipoAlerta,
		--LEFT(InicioValidezRol,7)  Valor
		LEFT(convert(varchar, getdate(), 100),LEN(convert(varchar, getdate(), 100))-12) Valor
		from BD_HERRAMIENTAS.mae.Afiliados 
where CONVERT(VARCHAR,LEFT(InicioValidezRol,7))=LEFT(convert(DATE,GETDATE()),7)
)
a
where a.RutAfiliado=@RutAfiliado