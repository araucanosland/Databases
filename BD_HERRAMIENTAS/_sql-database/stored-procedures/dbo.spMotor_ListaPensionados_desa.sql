IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_ListaPensionados_desa]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_ListaPensionados_desa]
GO

CREATE PROCEDURE [dbo].[spMotor_ListaPensionados_desa]--'90fc16b8-1b13-4808-bc51-2d32c2f5ad83','','','','',101
(
	@TOKEN VARCHAR(500),
	@NOMBRE VARCHAR(500) = '',
	@COMUNA VARCHAR(200) = '',
	@PRIORIDAD VARCHAR(150) = '',
	@RUT_EJECUTIVO VARCHAR(20) = '',
	@ESTADO_GES INT = 0
)
AS
BEGIN

DECLARE @COD_OFICINA INT =  security.fnSca_ObtenerOficinaByToken(@TOKEN)
	select
		 P.id_Asign
		,P.RUTPEN          
		,P.NOMBREPEN       
		,P.FECNAC          
		,P.CALLE           
		,P.NUMERO          
		,P.RESTO_DIRECCION 
		,P.COMUNA          
		,P.CIUDAD          
		,P.REGION          
		,P.FONOPARTICULAR  
		,P.FONOCELULAR     
		,P.EMAIL           
		,P.PRIORIDAD       
		,P.PREAPROBADO     
		,P.CODOFICINA      
		,P.RUTEJECUTIVO    
		,P.PERCAMPAÑA 
		,P.ESTADO_GESTION  
		,G.eges_nombre NOM_GESTION   
	from dbo.TabMotor_asignacion_Pensionados P
	LEFT JOIN [dbo].[TabMotor_EstadoGestionPensionados] G
	ON P.ESTADO_GESTION = G.eges_id
	WHERE P.CODOFICINA =  @COD_OFICINA
	AND ((@NOMBRE <> ''  AND P.NOMBREPEN LIKE '%' + @NOMBRE + '%') OR @NOMBRE = '')
	AND ((@COMUNA <> '' AND P.COMUNA LIKE '%' + @COMUNA + '%') OR @COMUNA = '')
	AND ((@PRIORIDAD <> '' AND P.PRIORIDAD LIKE '%' + @PRIORIDAD + '%') OR @PRIORIDAD = '')
	AND ((@RUT_EJECUTIVO <> '' AND P.RUTEJECUTIVO = @RUT_EJECUTIVO) OR @RUT_EJECUTIVO = '')
	AND ((@ESTADO_GES <> 0 AND P.ESTADO_GESTION = @ESTADO_GES) OR @ESTADO_GES = 0)
	ORDER BY P.id_Asign ASC   
	 	
END