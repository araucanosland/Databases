IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_Reasignacion]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_Reasignacion]
GO
CREATE PROCEDURE [dbo].[spMotor_Reasignacion]
(

@rutOrigen varchar(20),
@rutDestino varchar(20),
@tipCmp varchar(1),
@cntRea varchar(30),
@codOfi VARCHAR(10),
@origen_antes int,
@origen_despues int,
@destino_antes int,
@destino_despues int,
@token_agente varchar(50)
)
AS
BEGIN

Declare @Str	varchar(2000)	=''
declare @p		varchar(20)		= (select max(Periodo) from dbo.TabMotor_Asignacion)
declare @BASE VARCHAR(100) = 'BD_HERRAMIENTAS'



IF @tipCmp = 1 
BEGIN
set @Str='
			UPdate '+@BASE+'.dbo.TabMotor_Asignacion 
			Set Ejec_Asignacion='''+@rutDestino+'''			
			Where  id_Asign in( Select Top '+@cntRea+' id_Asign 
								From '+@BASE+'.dbo.TabMotor_Asignacion 
								Where Periodo='+@p+' 
								And Ejec_Asignacion='''+@rutOrigen+''' 
								And TipoAsignacion='+@tipCmp+' 
								And Oficina='+@codOfi+' 
								And id_Asign not in (select ges_bcam_uid from '+@BASE+'.dbo.TabMotor_Gestion)
								and (Celular<>'''' Or Telefono1<>'''' Or Telefono2<>'''')
								and Cuadrante = 1
								Order By NEWID() 
							)'

END
ELSE
BEGIN
set @Str='
			UPdate '+@BASE+'.dbo.TabMotor_Asignacion 
			Set Ejec_Asignacion='''+@rutDestino+'''			
			Where  id_Asign in( Select Top '+@cntRea+' id_Asign 
								From '+@BASE+'.dbo.TabMotor_Asignacion 
								Where Periodo='+@p+' 
								And Ejec_Asignacion='''+@rutOrigen+''' 
								And TipoAsignacion='+@tipCmp+' 
								And Oficina='+@codOfi+' 
								And id_Asign not in (select ges_bcam_uid from '+@BASE+'.dbo.TabMotor_Gestion)
								and (Celular<>'''' Or Telefono1<>'''' Or Telefono2<>'''')
								Order By NEWID() 
							)'
END
--
/*
Update A
			Set  NReg_Asignacion=(Select count(1) From '+@BASE+'.dbo.TabMotor_Asignacion Where Ejec_Asignacion='''+@rutDestino+''')
			From '+@BASE+'.dbo.TabMotor_Dotacion A
			Where Periodo='''+@P+''' And Rut='''+@rutDestino+'''	

			Update A
			Set  NReg_Asignacion=(Select count(1) From '+@BASE+'.dbo.TabMotor_Asignacion Where Ejec_Asignacion='''+@rutOrigen+''')
			From '+@BASE+'.dbo.TabMotor_Dotacion A
			Where Periodo='''+@P+''' And Rut='''+@rutOrigen+'''	

*/

Exec (@Str)



insert into TabMotor_LogReasignacion
(  
	 logr_fecha_accion
	,logr_rut_origen
	,logr_rut_destino
	,logr_origen_antes
	,logr_origen_despues
	,logr_destino_antes
	,logr_destino_despues
	,logr_cantidad_reasignada
	,logr_tipo_campania
	,logr_rut_agente
) 
values 
(
	GETDATE(),
	@rutOrigen,
	@rutDestino,
	@origen_antes,
	@origen_despues,
	@destino_antes,
	@destino_despues,
	@cntRea,
	@tipCmp,
	security.fnSca_ObtenerRutByToken(@token_agente)
)



END