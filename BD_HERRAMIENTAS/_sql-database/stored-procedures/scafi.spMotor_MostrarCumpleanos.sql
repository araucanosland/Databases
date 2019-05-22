IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[scafi].[spMotor_MostrarCumpleanos]') AND type = 'P')
DROP PROCEDURE [scafi].[spMotor_MostrarCumpleanos]
GO
--exec [scafi].[spMotor_MostrarCumpleanos] 13994569
CREATE procedure [scafi].[spMotor_MostrarCumpleanos]
 @RutAfiliado int
as

select 'Cumpleaños' Estado,
		convert(varchar,FechaNacimiento) FechaNacimiento,
		dbo.FN_getEdad(FechaNacimiento) Edad,
		RutAfiliado
		 from BD_HERRAMIENTAS.mae.Afiliados
where convert(varchar,right(FechaNacimiento,5))=right(convert(date,GETDATE()),5)
and RutAfiliado=@RutAfiliado
UNION ALL
	select distinct
		'NUEVO' Estado,
		LEFT(InicioValidezRol,7)  FechaNacimiento,
		dbo.FN_getEdad(FechaNacimiento) Edad,
		RutAfiliado
		from BD_HERRAMIENTAS.mae.Afiliados 
where CONVERT(VARCHAR,LEFT(InicioValidezRol,7))=LEFT(convert(DATE,GETDATE()),7)
and RutAfiliado=@RutAfiliado