IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Guarda_Detalle_GestionMantencion]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Guarda_Detalle_GestionMantencion]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Guarda_Detalle_GestionMantencion]
@TOKEN VARCHAR(250)
,@ID_CAB_GES_MANTENCION INT
,@RUT_EMPRESA VARCHAR(15)
,@TEMA VARCHAR(15)
,@SUBTEMA VARCHAR(200)
,@RUT_AFILIADO VARCHAR(MAX)
,@COMENTARIOS VARCHAR(MAX)
,@ALERTA INT
AS
BEGIN 
DECLARE @RUT_EJECUTIVO_INGRESO VARCHAR(15) = CONVERT(VARCHAR, security.fnSca_ObtenerRutByToken (@TOKEN))
	INSERT INTO [carteras].[TabCart_DetalleGestionMantencion]
	VALUES (@ID_CAB_GES_MANTENCION
			,@RUT_EMPRESA
			,@TEMA
			,@SUBTEMA
			,@RUT_AFILIADO
			,@COMENTARIOS
			,@RUT_EJECUTIVO_INGRESO
			,SYSDATETIME()
			,@ALERTA
			,0
			,0)
	DECLARE @ID_DETALLE_MAN INT = (SELECT TOP 1 IdGesMantencion FROM [carteras].[TabCart_DetalleGestionMantencion]
	WHERE RutEmpresa = @RUT_EMPRESA
	ORDER BY FechaIngreso DESC)
	UPDATE  [carteras].[TabCart_DetalleGestionMantencion]
		SET IdDetalleOrigen = @ID_DETALLE_MAN
	WHERE IdGesMantencion = @ID_DETALLE_MAN		
END