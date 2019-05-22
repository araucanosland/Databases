IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_GuardaAfiliadosAnexos]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_GuardaAfiliadosAnexos]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_GuardaAfiliadosAnexos]
@RUT_AFILIADO VARCHAR(15)
,@ID_ANEXO INT
AS
BEGIN
	DECLARE @ANX_OBTENIDO INT = 0
	DECLARE @CONTADOR INT = 0
	
	SELECT @ANX_OBTENIDO = IdAnexo FROM BD_HERRAMIENTAS.carteras.TabCart_AfiliadosAnexo WHERE RutAfiliado = @RUT_AFILIADO
	
	IF @ANX_OBTENIDO = 0 
	BEGIN 
		INSERT BD_HERRAMIENTAS.carteras.TabCart_AfiliadosAnexo VALUES(@ID_ANEXO, @RUT_AFILIADO)
		--SELECT TOP 1 @ID_ANEXO as idAnexo, CONVERT(VARCHAR, Afiliado_Rut) + '-' + Afiliado_Dv as RutAfilaido, Nombre + ' ' + Apellido AS Nombre, Empresa_Rut + '-' + Empresa_Dv AS RutEmpresa, Empresa   
		--FROM dbo.TabMotor_Asignacion
		--WHERE CONVERT(VARCHAR, Afiliado_Rut) + '-' + Afiliado_Dv = @RUT_AFILIADO
		
		SET @CONTADOR = (SELECT COUNT(IdAnexo) FROM BD_HERRAMIENTAS.carteras.TabCart_AfiliadosAnexo WHERE IdAnexo = @ID_ANEXO)
		UPDATE BD_HERRAMIENTAS.[carteras].[TabCart_AnexoEmpresa] 
		SET NumTrabajadores = @CONTADOR
		WHERE IdEmpresaAnexo = @ID_ANEXO

	END
	ELSE IF @ANX_OBTENIDO <> @ID_ANEXO
	BEGIN
		UPDATE BD_HERRAMIENTAS.carteras.TabCart_AfiliadosAnexo 
		SET IdAnexo =  @ID_ANEXO
		WHERE RutAfiliado = @RUT_AFILIADO
		
		SET @CONTADOR = (SELECT COUNT(IdAnexo) FROM BD_HERRAMIENTAS.carteras.TabCart_AfiliadosAnexo WHERE IdAnexo = @ID_ANEXO)
		UPDATE BD_HERRAMIENTAS.[carteras].[TabCart_AnexoEmpresa] 
		SET NumTrabajadores = @CONTADOR
		WHERE IdEmpresaAnexo = @ID_ANEXO
		
		SET @CONTADOR = (SELECT COUNT(IdAnexo) FROM BD_HERRAMIENTAS.carteras.TabCart_AfiliadosAnexo WHERE IdAnexo = @ANX_OBTENIDO)
		UPDATE BD_HERRAMIENTAS.[carteras].[TabCart_AnexoEmpresa] 
		SET NumTrabajadores = @CONTADOR
		WHERE IdEmpresaAnexo = @ANX_OBTENIDO
	END
END